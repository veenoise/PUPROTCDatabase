# PUPROTCDatabase

## Usage:

1. Create a virtual environment

    ```
    python3 -m venv .venv
    ```

2. Use the virtual environment

    On Linux:

    ```
    source .venv/bin/activate
    ```

    On Windows:


    ```
    <path_to_.venv>\Scripts\Activate.ps1
    ```

3. Install python dependencies

    ```
    pip3 install -r requirements.txt
    ```

4. You need to have a .env file with contents that look like this:

    ```
    SESSION_SECRET=b'something_string_of_type_byte'
    HASHING_SALT=ThisIsAStringForTheSalt
    DATABASE_URL=postgresql://user:password@network:port/puprotcdatabase
    ```

5. You also need to have a puprotcdatabase postgresql database. The password you must enter in this database is the output of the hashing algorithm inside the app.py:

    ```
    HASHING_ITERATION=600_000
    pbkdf2_hmac('sha256', "thePasswordYouWant".encode('utf-8'), "theHashInThe.envOfTypeString".encode('utf-8') * 2, HASHING_ITERATION).hex()
    ```

6. Run the flask app in debug mode:

    ```
    python app.py
    ```
