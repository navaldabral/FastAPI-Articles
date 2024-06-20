from fastapi import FastAPI, Depends, HTTPException
from models import Articledb, Commentsdb, Base
from schemas import Articles, Comments, ArticleUpdate
from database import engine, get_db, SessionLocal
from sqlalchemy.orm import Session, joinedload
from sqlalchemy import asc, desc
from typing import List, Optional

app = FastAPI()

Base.metadata.create_all(engine)

@app.get("/api/articles/")
def read_articles(
    skip: int = 0,
    limit: int = 10,
    sort_by: str = "created_at",
    sort_order: str = "desc",
    author: Optional[str] = None,
    keyword: Optional[str] = None,
    db: Session = Depends(get_db)
):
    query = db.query(Articledb)
    if author:
        query = query.filter(Articledb.author == author)
    if keyword:
        query = query.filter(Articledb.title.contains(keyword) | Articledb.content.contains(keyword))
    if sort_order == "asc":
        query = query.order_by(asc(getattr(Articledb, sort_by)))
    else:
        query = query.order_by(desc(getattr(Articledb, sort_by)))
    articles = query.offset(skip).limit(limit).all()
    if not articles:
        raise HTTPException(status_code=404, detail="Articles not found")
    return articles

@app.post("/api/articles")
def create_articles(request: Articles, db: Session = Depends(get_db)):
    new_articles = []
    for article in request.articles:
        new_article = Articledb(title=article.title, content=article.content, author=article.author)
        db.add(new_article)
        db.commit()
        db.refresh(new_article)
        new_articles.append(new_article)
    return new_articles[-1]

@app.get("/api/articles/{article_id}")
def get_article(article_id: int, db: Session = Depends(get_db)):
    article = db.query(Articledb).options(joinedload(Articledb.comments)).filter(Articledb.id == article_id).first()
    if article is None:
        raise HTTPException(status_code=404, detail="Article not found")
    return {
        "id": article.id,
        "title": article.title,
        "content": article.content,
        "author": article.author,
        "created_at": article.created_at,
        "comments": [
            {
                "id": comment.id,
                "comment": comment.comment,
                "author": comment.author,
                "article_id": comment.article_id
            }
            for comment in article.comments
        ]
    }

@app.put("/api/articles/{article_id}")
def update_article(article_id: int, article_update: ArticleUpdate):
    db = SessionLocal()
    article = db.query(Articledb).filter(Articledb.id == article_id).first()
    
    if article:
        article.title = article_update.title
        article.content = article_update.content
        article.author = article_update.author
        db.commit()
        db.refresh(article)
        return {"message": "Article Updated successfully"}
    raise HTTPException(status_code=404, detail="Article not found")

@app.post("/api/articles/{article_id}/comments")
def add_comment(article_id: int, comment: Comments, db: Session = Depends(get_db)):
    article = db.query(Articledb).filter(Articledb.id == article_id).first()
    if not article:
        raise HTTPException(status_code=404, detail="Article not found")
    
    new_comment = Commentsdb(comment=comment.Comments, article_id=article_id, author=comment.author)
    db.add(new_comment)
    db.commit()
    db.refresh(new_comment)
    return {
        "id": new_comment.id,
        "comment": new_comment.comment,
        "author": new_comment.author,
        "article_id": new_comment.article_id
    }

@app.delete("/api/articles/{article_id}")
def delete_article(article_id: int, db: Session = Depends(get_db)):
    article = db.query(Articledb).filter(Articledb.id == article_id).first()
    if article:
        db.delete(article)
        db.commit()
        return {"message": "Article deleted successfully"}
    raise HTTPException(status_code=404, detail="Article not found")




