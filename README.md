---
## Installation

### Setup
1. Clone the repository

    git clone https://github.com/navaldabral/articles.git

    cd articles
2. Create a virtual environment and activate it
   
   virtualenv venv

   source venv/bin/activate

3. Install the dependencies

    pip install -r requirements.txt

4. Configure the database

    Create a MySQL database. Set name `blog`

    upload the given `blog.sql` in `blog` database

    or

    Models Create automaticaly when FastAPI run

<img width="1469" alt="Screenshot 2024-06-20 at 10 03 59 AM" src="https://github.com/navaldabral/articles/assets/29625991/cff60130-1355-43c5-b662-c3c69307a05a">


6. Run the application

    uvicorn main:app --reload

7. To access the APIs visit this URL http://127.0.0.1:8000/docs

---

### Endpoints

#### Articles

<img width="1470" alt="Screenshot 2024-06-20 at 10 01 32 AM" src="https://github.com/navaldabral/articles/assets/29625991/04952e4e-b443-403a-9786-a82b3b3b10a0">


+ GET /api/articles/

    Retrieve a list of articles. Supports filtering by author and keyword, and sorting.

+ POST /api/articles

    Create new articles.

+ GET /api/articles/{article_id}

    Retrieve a specific article by ID.

+ PUT /api/articles/{article_id}

    Update an article by ID.

+ DELETE /api/articles/{article_id}

    Delete an article by ID.

+ POST /api/articles/{article_id}/comments

    Add a comment to an article.

---

### Unit Tests

for the unit test, you run this command `pytest test_main.py`:

---
