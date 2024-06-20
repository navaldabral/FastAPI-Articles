from sqlalchemy import Column, Integer, String, Date, func, Text, ForeignKey
from database import Base
from sqlalchemy.sql import text
from sqlalchemy.orm import relationship


class Articledb(Base):
    __tablename__ = 'articles'

    id = Column(Integer, primary_key=True, index=True)
    title = Column(String(length=100))
    content = Column(Text)
    author = Column(String(length=100))
    created_at = Column(Date, server_default=text('CURRENT_DATE'))
    comments = relationship("Commentsdb", back_populates="article")

    class Config:
        orm_mode = True

class Commentsdb(Base):
    __tablename__ = 'comments'

    id = Column(Integer, primary_key=True, index=True)
    comment = Column(String(length=100))
    author = Column(String(length=100))
    article_id = Column(Integer, ForeignKey('articles.id'))
    article = relationship("Articledb", back_populates="comments")
