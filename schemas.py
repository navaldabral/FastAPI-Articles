from pydantic import BaseModel, Field
from typing import List

class Article(BaseModel):
    title: str = Field("", min_length=5, max_length=100)
    content: str = Field("", min_length=10)
    author: str = Field("", min_length=3, max_length=100)

class Articles(BaseModel):
    articles: List[Article]    

class Comments(BaseModel):
    Comments : str = Field("", min_length=10, max_length=100)
    author : str = Field("", min_length=5, max_length=100)

class ArticleUpdate(BaseModel):
    title: str = Field("", min_length=5, max_length=100)
    content: str = Field("", min_length=10, max_length=100)
    author: str = Field("", min_length=3, max_length=100)