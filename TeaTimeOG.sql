CREATE TABLE articles (
    article_id INT AUTO_INCREMENT PRIMARY KEY,
    author_first_name VARCHAR(100) NOT NULL,
    author_last_name VARCHAR(100) NOT NULL,
    author_email VARCHAR(100) UNIQUE NOT NULL,
    article_name varchar (45),
    article_description LONGTEXT,
    publish_date DATE NOT NULL
);

alter table articles
modify article_name longtext;

alter table articles
add column article_description varchar (100)
after article_name;

CREATE TABLE clothing_item_photo (
    clothing_item_photo_id INT AUTO_INCREMENT PRIMARY KEY,
    clothing_item_photo_url VARCHAR(50)
);

CREATE TABLE fashion (
    clothing_item_id INT AUTO_INCREMENT PRIMARY KEY,
    clothing_item_name VARCHAR(100),
    clothing_item_description LONGTEXT,
    clothing_item_photo_id INT UNIQUE,
    upload_date DATE NOT NULL,
    FOREIGN KEY (clothing_item_photo_id) REFERENCES clothing_item_photo(clothing_item_photo_id)
);

CREATE TABLE recipe_photo (
    recipe_photo_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_photo_url VARCHAR(50)
);

CREATE TABLE recipes (
    recipe_id INT AUTO_INCREMENT PRIMARY KEY,
    recipe_description LONGTEXT,
    recipe_type VARCHAR(100),
    recipe_photo_id INT UNIQUE,
    ingredient_list LONGTEXT,
    directions LONGTEXT,
    post_date DATE NOT NULL,
    FOREIGN KEY (recipe_photo_id) REFERENCES recipe_photo(recipe_photo_id)
);

CREATE TABLE decor_photo (
    decor_photo_id INT AUTO_INCREMENT PRIMARY KEY,
    decor_photo_url VARCHAR(50)
);

CREATE TABLE decor (
    decor_id INT AUTO_INCREMENT PRIMARY KEY,
    decor_name VARCHAR(100),
    decor_description LONGTEXT,
    decor_photo_id INT UNIQUE,
    manufacture_date DATE NOT NULL,
    FOREIGN KEY (decor_photo_id) REFERENCES decor_photo(decor_photo_id)
);

CREATE TABLE sewing_example_photo (
    sewing_example_photo_id INT AUTO_INCREMENT PRIMARY KEY,
    sewing_example_photo_url VARCHAR(50)
);
CREATE TABLE sewing (
    pattern_id INT AUTO_INCREMENT PRIMARY KEY,
    pattern_name varchar (100),
    pattern_description LONGTEXT,
    sewing_example_photo_id INT UNIQUE,
    creation_date DATE NOT NULL,
    FOREIGN KEY (sewing_example_photo_id) REFERENCES sewing_example_photo(sewing_example_photo_id)
);

ALTER TABLE sewing add COLUMN article_id int after creation_date;
ALTER TABLE fashion ADD COLUMN article_id INT, ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);
ALTER TABLE decor ADD COLUMN article_id INT, ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);
ALTER TABLE crafting ADD COLUMN article_id INT, ADD FOREIGN KEY (article_id) REFERENCES articles(article_id);


show full tables; 
select * from decor_photo where decor_photo_id is not null;
select * from articles;

show create table decor_photo
-- Assign recipe_photo_id = 10 to recipe_id = 1
UPDATE recipes
SET recipe_type = 'sandwich'
WHERE recipe_id = 2

alter table articles
drop column article_description

update sewing
set article_id = 40
where pattern_id = 10

insert into clothing_item_photo (clothing_item_photo_id, clothing_item_photo_url)
values (10, 'sheer.png');


insert into articles (article_id, author_first_name, author_last_name, author_email, article_name, article_description, publish_date)
values (32,
'Eva',
'Cifre',
'Evacifre@ymail.com',
'Gender Inequality in Household Chores and Work-Family Conflict',
'The fact that the permeability between family and work scopes produces work-family conflict (WFC) is well established. As such, this research aims to check whether the unequal involvement in household chores between men and women is associated with increased WFC in women and men, interpreting the results also from the knowledge that arise from gender studies. A correlational study was carried out by means a questionnaire applied to 515 subjects (63% men) of two independent samples of Spanish men and women without emotional relationship, who lived with their heterosexual partner. As expected, results firstly show unequal involvement in household chores by women and men as it is higher in women than in men, and the perception of partner involvement is lower in women than in men. Secondly, those unequal involvements relate differently to men and women on different ways of work-family interaction. They do not increase WFC in women compared to men, although there are tangentially significant differences in work conflict (WC) and statistically significant in family conflict (FC). However, perception of partner involvement on household chores increases WFC both in men and in women but not WC nor FC. Nevertheless, increase on marital conflict (MC) by domestic tasks neither affect in a significant way WFC in women nor in men, but increase WC in both women and men and FC only in women. Results also confirm that subject involvement on household chores is not a significant predictor of WFC in women nor in men, and that MC by domestic tasks is a statistically significant predictor in women of WFC and FC, but not in men. Thus, results show that traditional gender roles still affect the way men and women manage the work and family interaction, although the increased WFC due to involvement in housework is not exclusive to women, but also occurs in men. Personal and institutional recommendations are made on the basis of these results to cope with these conflicts.',
'2018-08-03')