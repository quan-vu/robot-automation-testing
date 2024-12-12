# Install the required packages
# pip install graphene Flask

from flask import Flask, request
from graphene import ObjectType, String, Schema, Field

# Define a simple query
class Query(ObjectType):
    hello = String(name=String(default_value="stranger"))

    def resolve_hello(root, info, name):
        return f"Hello, {name}!"

# Create the schema
schema = Schema(query=Query)

# Set up the Flask app
app = Flask(__name__)

# Create a GraphQL endpoint
@app.route("/graphql", methods=["POST"])
def graphql():
    data = request.get_json()
    result = schema.execute(data.get("query"))
    return {"data": result.data}

# Run the Flask app
if __name__ == "__main__":
    app.run(debug=True)