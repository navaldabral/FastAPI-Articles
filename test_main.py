from fastapi.testclient import TestClient
from sqlalchemy import create_engine, MetaData
from sqlalchemy.orm import sessionmaker, declarative_base
from main import app, get_db
from models import Base
from databases import Database

DATABASE_URL = "mysql+pymysql://root@localhost:3306/blog"

database = Database(DATABASE_URL)
metadata = MetaData()

engine = create_engine(DATABASE_URL)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

app.dependency_overrides[get_db] = get_db
client = TestClient(app)

sample_article = {
    "articles": [
        {
            "title": "Test Article",
            "content": "This is a test article",
            "author": "Author1"
        }
    ]
}

updated_article = {
    "title": "Updated Test Article",
    "content": "This is an updated test article",
    "author": "Author2"
}

sample_comment = {
    "Comments": "This is a test comment",
    "author": "Commenter1"
}

def test_create_article():
    response = client.post("/api/articles", json=sample_article)
    assert response.status_code == 200
    # assert len(response.json()) == 1
    assert response.json()["title"] == sample_article["articles"][0]["title"]

def test_read_articles():
    response = client.post("/api/articles", json=sample_article)
    response = client.get("/api/articles/")
    assert response.status_code == 200
    assert len(response.json()) > 0

def test_get_article():
    response = client.post("/api/articles", json=sample_article)
    article_id = response.json()["id"]
    response = client.get(f"/api/articles/{article_id}")
    assert response.status_code == 200
    assert response.json()["title"] == sample_article["articles"][0]["title"]

def test_update_article():
    response = client.post("/api/articles", json=sample_article)
    article_id = response.json()["id"]
    update_response = client.put(f"/api/articles/{article_id}", json=updated_article)
    assert update_response.status_code == 200
    update_response.json()

def test_delete_article():
    response = client.post("/api/articles", json=sample_article)
    article_id = response.json()["id"]
    response = client.delete(f"/api/articles/{article_id}")
    assert response.status_code == 200
    response = client.get(f"/api/articles/{article_id}")
    assert response.status_code == 404

def test_add_comment():
    response = client.post("/api/articles", json=sample_article)
    article_id = response.json()["id"]
    response = client.post(f"/api/articles/{article_id}/comments", json=sample_comment)
    assert response.status_code == 200
    assert response.json()["comment"] == sample_comment["Comments"]
