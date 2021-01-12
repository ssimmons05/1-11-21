//Creating the database schema
create table Recipe (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(25), description VARCHAR(50), instructions VARCHAR(500)) ENGINE=InnoDB DEFAULT CHARSET=utf8;

create table Ingredient (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(50)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table Measure (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30)) ENGINE=InnoDB DEFAULT CHARSET=utf8; 

create table RecipeIngredient (recipe_id INT NOT NULL, ingredient_id INT NOT NULL, measure_id INT, amount INT, 

	CONSTRAINT fk_recipe FOREIGN KEY(recipe_id) REFERENCES Recipe(id), 

	CONSTRAINT fk_ingredient FOREIGN KEY(ingredient_id) REFERENCES Ingredient(id), 

	CONSTRAINT fk_measure FOREIGN KEY(measure_id) REFERENCES Measure(id)) 

	ENGINE=InnoDB DEFAULT CHARSET=utf8; 


//Inserting Recipe's, Ingredients, Measures, and RecipeIngredients into tables
INSERT INTO Recipe (name, description, instructions) VALUES('Hot chocolate', 'Good for cold winter days', 'Mix boiling water and hot chocolate mix in a mug.  Add marshmallows as desired.');
INSERT INTO Ingredient (name) VALUES('Hot Chocolate Mix'), ('Water');
INSERT INTO Measure (name) VALUES('Packet'), ('Cup');
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 1, 1, 1); 
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (1, 2, 2, 1);

INSERT INTO Recipe (name, description, instructions) VALUES('Hotdog', 'Just a plain ole hotdog', 'Boil/or microwave hotdog. Place in bun.');
INSERT INTO Ingredient (name) VALUES('Hotdog'), ('Bun');
INSERT INTO Measure (name) VALUES('Link'), ('Null');
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (2, 3, 3, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (2, 4, 4, 1);

INSERT INTO Recipe (name, description, instructions) VALUES('Cheese & crackers', 'Cheese on a cracker', 'Put a piece of cheese on a cracker. Eat');
INSERT INTO Ingredient (name) VALUES('Cheese'), ('Cracker');
INSERT INTO Measure (name) VALUES('Cube'), ('Null');
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (3, 5, 5, 1);
INSERT INTO RecipeIngredient (recipe_id, ingredient_id, measure_id, amount) VALUES (3, 6, 6, 1);

//Updating an ingredient
UPDATE Ingredient
SET name = 'Hot Water'
WHERE name = 'Water';



//Get a list of all the recipes
SELECT * from Recipe

//Get a list of all the ingredients
SELECT * FROM Ingredient;

//Get a list of all the measurements
SELECT * FROM Measure;

//Get a list of all the tables ID #'s
SELECT * FROM RecipeIngredient;

SELECT r.name AS 'Recipe', r.instructions, ri.amount AS 'Amount', mu.name AS 'Unit of Measure', i.name AS 'Ingredient' 
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id;

//Selecting a specific ingredient from the database
SELECT *
From Recipe r
JOIN RecipeIngredient ri on ri.recipe_id = r.id  
JOIN Ingredient i on i.id = ri.ingredient_id 
WHERE i.name = "Cheese"
