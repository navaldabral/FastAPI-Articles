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

5. Run the application

    uvicorn main:app --reload
