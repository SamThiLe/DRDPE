USE PastryEmporium
GO

/*
insert into Categories VALUES ('Loaf', 'A list of loaves of bread')
insert into Categories VALUES ('Square', 'A list of dessert squares')
insert into Categories VALUES ('Cake', 'A list of delicious cakes')
insert into Categories VALUES ('Buns', 'A list of warm buns')
insert into Categories VALUES ('Danish', 'A list of sweet pastries')
insert into Categories VALUES ('Muffin', 'A list of fresh muffins')
insert into Categories VALUES ('Croissant', 'A list of flakey croissants')
insert into Categories VALUES ('Donut', 'A list of delightful donuts')
GO
*/


DELETE FROM OrderHistory;
GO
DELETE FROM CartItems;
GO
DELETE FROM Cart;
GO
DELETE FROM products;
GO
DELETE FROM SiteImages
GO
DELETE FROM Addresses
GO
DELETE FROM Customers
GO
DELETE FROM adminLogin
GO
DBCC CHECKIDENT ('OrderHistory', RESEED, 0)
GO
DBCC CHECKIDENT ('Products', RESEED, 1000)
GO
DBCC CHECKIDENT ('SiteImages', RESEED, 0)
GO
DBCC CHECKIDENT ('Cart', RESEED, 0)
GO
DBCC CHECKIDENT ('CartItems', RESEED, 0)
GO
DBCC CHECKIDENT ('Addresses', RESEED, 0)
GO
DBCC CHECKIDENT ('Customers', RESEED, 0)
GO
DBCC CHECKIDENT ('adminLogin', RESEED, 0)
GO

--bread images
insert into SiteImages VALUES ('Place Holder', '~/images/placeholder.jpg', GETDATE(), 'Placeholder image', 1, 1, 1);
insert into SiteImages VALUES ('White Bread', '~/images/whitebread.jpg', GETDATE(), 'A loaf of white bread', 1, 1, 1);
insert into SiteImages VALUES ('Brown Bread', '~/images/brownbread.jpg', GETDATE(), 'A loaf of Brown bread', 1, 1, 1);
insert into SiteImages VALUES ('Rye Bread', '~/images/ryebread.jpg', GETDATE(), 'A loaf of Rye bread', 1, 1, 1);
insert into SiteImages VALUES ('Sour Bread', '~/images/sourbread.jpg', GETDATE(), 'A loaf of Sourdough bread', 1, 1, 1);
insert into SiteImages VALUES ('Whole Wheat Bread', '~/images/wholewheatbread.jpg', GETDATE(), 'A loaf of whole wheat bread', 1, 1, 1);
insert into SiteImages VALUES ('Multigrain Bread', '~/images/multigrainbread.jpg', GETDATE(), 'A loaf of multigrain bread', 1, 1, 1);
insert into SiteImages VALUES ('Maple Bread', '~/images/maplebread.jpg', GETDATE(), 'A loaf of maple bread', 1, 1, 1);

--Square images
insert into SiteImages VALUES ('Nanimo Square', '~/images/nanaimosquare.jpg', GETDATE(), 'A pack of nanaimo squares', 1, 1, 1);
insert into SiteImages VALUES ('Marshmallow Square', '~/images/marshmallowsquare.jpg', GETDATE(), 'A pack of marshmallow squares', 1, 1, 1);
insert into SiteImages VALUES ('Date Square', '~/images/datesquare.jpg', GETDATE(), 'A pack of date squares', 1, 1, 1);
insert into SiteImages VALUES ('Blueberry Square', '~/images/blueberrysquare.jpg', GETDATE(), 'A pack of blueberry squares', 1, 1, 1);
insert into SiteImages VALUES ('Lemon Square', '~/images/lemonsquare.jpg', GETDATE(), 'A pack of lemon squares', 1, 1, 1);
insert into SiteImages VALUES ('Pecan Square', '~/images/pecansquare.jpg', GETDATE(), 'A pack of pecan squares', 1, 1, 1);
insert into SiteImages VALUES ('Peanutbutter Square', '~/images/peanutbuttersquare.jpg', GETDATE(), 'A pack of peanut butter squares', 1, 1, 1);

--Cake images
insert into SiteImages VALUES ('Triple Chocolate Cake', '~/images/triplechocolatecake.jpg', GETDATE(), 'A triple chocolate cake', 1, 1, 1);
insert into SiteImages VALUES ('Devils Foodcake', '~/images/devilsfoodcake.jpg', GETDATE(), 'A devils food cake', 1, 1, 1);
insert into SiteImages VALUES ('Angel Foodcake', '~/images/angelfoodcake.jpg', GETDATE(), 'A angel food cake', 1, 1, 1);
insert into SiteImages VALUES ('Cheesecake', '~/images/cheesecake.jpg', GETDATE(), 'A cheesecake', 1, 1, 1);
insert into SiteImages VALUES ('Lemon Meringue Cake', '~/images/lemonmeringuecake.jpg', GETDATE(), 'A lemon meringue cake', 1, 1, 1);
insert into SiteImages VALUES ('Black Forest Cake', '~/images/blackforestcake.jpg', GETDATE(), 'A black forest cake', 1, 1, 1);
insert into SiteImages VALUES ('Chocolate Mousse Cake', '~/images/chocolatemoussecake.jpg', GETDATE(), 'A chocolate mousse cake', 1, 1, 1);
insert into SiteImages VALUES ('Pound Cake', '~/images/poundcake.jpg', GETDATE(), 'A pound cake', 1, 1, 1);

--Bun images
insert into SiteImages VALUES ('White Bun', '~/images/whitebun.jpg', GETDATE(), 'A white bun', 1, 1, 1);
insert into SiteImages VALUES ('Brown Bun', '~/images/brownbun.jpg', GETDATE(), 'A brown bun', 1, 1, 1);
insert into SiteImages VALUES ('Rye Bun', '~/images/ryebun.jpg', GETDATE(), 'A rye bun', 1, 1, 1);
insert into SiteImages VALUES ('Sourdough Bun', '~/images/sourdoughbun.jpg', GETDATE(), 'A sourdough bun', 1, 1, 1);
insert into SiteImages VALUES ('Wholewheat Bun', '~/images/wholewheatbun.jpg', GETDATE(), 'A whole wheat bun', 1, 1, 1);
insert into SiteImages VALUES ('Multigrain Bun', '~/images/multigrainbun.jpg', GETDATE(), 'A multigrain bun', 1, 1, 1);

--Danish images
insert into SiteImages VALUES ('Blueberry Danish', '~/images/blueberrydanish.jpg', GETDATE(), 'A blueberry danish', 1, 1, 1);
insert into SiteImages VALUES ('Raspberry Danish', '~/images/raspberrydanish.jpg', GETDATE(), 'A raspberry danish', 1, 1, 1);
insert into SiteImages VALUES ('Strawberry Danish', '~/images/strawberrydanish.jpg', GETDATE(), 'A strawberry danish', 1, 1, 1);
insert into SiteImages VALUES ('Caramel Danish', '~/images/carameldanish.jpg', GETDATE(), 'A caramel danish', 1, 1, 1);
insert into SiteImages VALUES ('Chocolate Danish', '~/images/chocolatedanish.jpg', GETDATE(), 'A chocolate danish', 1, 1, 1);
insert into SiteImages VALUES ('Butter Danish', '~/images/butterdanish.jpg', GETDATE(), 'A butter danish', 1, 1, 1);
insert into SiteImages VALUES ('Creamcheese Danish', '~/images/creamcheesedanish.jpg', GETDATE(), 'A cream cheese danish', 1, 1, 1);

--Muffin images
insert into SiteImages VALUES ('Blueberry Muffin', '~/images/blueberrymuffin.jpg', GETDATE(), 'A blueberry muffin', 1, 1, 1);
insert into SiteImages VALUES ('Raspberry Muffin', '~/images/raspberrymuffin.jpg', GETDATE(), 'A raspberry muffin', 1, 1, 1);
insert into SiteImages VALUES ('Strawberry Muffin', '~/images/strawberrymuffin.jpg', GETDATE(), 'A strawberry muffin', 1, 1, 1);
insert into SiteImages VALUES ('Caramel Muffin', '~/images/caramelmuffin.jpg', GETDATE(), 'A caramel muffin', 1, 1, 1);
insert into SiteImages VALUES ('Chocolate Muffin', '~/images/chocolatemuffin.jpg', GETDATE(), 'A chocolate muffin', 1, 1, 1);
insert into SiteImages VALUES ('Pecan Muffin', '~/images/butterpecanmuffin.jpg', GETDATE(), 'A butter pecan muffin', 1, 1, 1);

--Croissant images
insert into SiteImages VALUES ('Cheese Croissant', '~/images/cheesecroissant.jpg', GETDATE(), 'A butter cheese croissant', 1, 1, 1);
insert into SiteImages VALUES ('Butter Croissant', '~/images/buttercroissant.jpg', GETDATE(), 'A butter croissant', 1, 1, 1);
insert into SiteImages VALUES ('Chocolate Croissant', '~/images/chocolatecroissant.jpg', GETDATE(), 'A chocolate croissant', 1, 1, 1);
insert into SiteImages VALUES ('Almond Croissant', '~/images/almondcroissant.jpg', GETDATE(), 'A almond croissant', 1, 1, 1);
insert into SiteImages VALUES ('Ham and Cheese Croissant', '~/images/hamandcheesecroissant.jpg', GETDATE(), 'A ham and cheese croissant', 1, 1, 1);
insert into SiteImages VALUES ('Bacon Croissant', '~/images/baconcroissant.jpg', GETDATE(), 'A bacon croissant', 1, 1, 1);

--Donut images
insert into SiteImages VALUES ('Blueberry Filled Donut', '~/images/blueberryfilleddonut.jpg', GETDATE(), 'A blueberry filled donut', 1, 1, 1);
insert into SiteImages VALUES ('Raspberry Filled Donut', '~/images/raspberryfilleddonut.jpg', GETDATE(), 'A raspberry filled donut', 1, 1, 1);
insert into SiteImages VALUES ('Strawberry Filled Donut', '~/images/strawberryfilleddonut.jpg', GETDATE(), 'A strawberry filled donut', 1, 1, 1);
insert into SiteImages VALUES ('Caramel Donut', '~/images/carameldonut.jpg', GETDATE(), 'A caramel donut', 1, 1, 1);
insert into SiteImages VALUES ('Chocolate Glazed Donut', '~/images/chocolateglazeddonut.jpg', GETDATE(), 'A chocolate glazed donut', 1, 1, 1);
insert into SiteImages VALUES ('Sugar Donut', '~/images/sugardonut.jpg', GETDATE(), 'A sugar donut', 1, 1, 1);
insert into SiteImages VALUES ('Boston Cream Donut', '~/images/bostoncreamdonut.jpg', GETDATE(), 'A boston cream donut', 1, 1, 1);

--Testing images
insert into SiteImages VALUES ('White Bread 2', '~/images/whitebread2.jpg', GETDATE(), 'A loaf of white bread', 1, 1, 1);
insert into SiteImages VALUES ('White Bread 3', '~/images/whitebread3.jpg', GETDATE(), 'A loaf of white bread', 1, 1, 1);
insert into SiteImages VALUES ('White Bread 4', '~/images/whitebread4.jpg', GETDATE(), 'A loaf of white bread', 1, 1, 1);
GO


--Bread
insert into Products VALUES ('White Bread', 'A loaf of white bread', 'A delicious home made loaf of white bread using the finest ingredients', 1, 3.50, 1, 1, 2)
insert into Products VALUES ('Brown Bread', 'A loaf of Brown bread', 'A delicious home made loaf of brown bread using the finest ingredients', 1, 4.50, 1, 1, 3)
insert into Products VALUES ('Rye Bread', 'A loaf of Rye bread', 'A delicious home made loaf of rye bread using the finest ingredients', 1, 5.50, 0, 1, 4)
insert into Products VALUES ('Sourdough Bread', 'A loaf of Sourdough bread', 'A delicious home made loaf of sourdough bread using the finest, hand-picked ingredients', 1, 3.50, 0, 1, 5)
insert into Products VALUES ('Whole Wheat Bread', 'A loaf of whole wheat bread', 'A delicious home made loaf of whole wheat bread using the finest, hand-picked ingredients', 1, 4.50, 0, 1, 6)
insert into Products VALUES ('Multigrain Bread', 'A loaf of multigrain bread', 'A delicious home made loaf of multigrain bread using the finest, hand-picked ingredients', 1, 5.50, 0, 1, 7)
insert into Products VALUES ('Maple Bread', 'A loaf of maple bread', 'A delicious home made loaf of maple bread using the finest, hand-picked ingredients', 1, 6.50, 0, 1, 8)

--Square
insert into Products VALUES ('Nanaimo Square', 'A pack of nanaimo squares', 'A delicious home made pack of nanaimo squares using the finest, hand-picked ingredients', 1, 3.50, 1, 2, 9)
insert into Products VALUES ('Marshmallow Square', 'A pack of marshmallow squares', 'A delicious home made pack of marshmallow squares using the finest, hand-picked ingredients', 1, 4.50, 1, 2, 10)
insert into Products VALUES ('Date Square', 'A pack of date squares', 'A delicious home made pack of date squares using the finest, hand-picked ingredients', 1, 5.50, 0, 2, 11)
insert into Products VALUES ('Blueberry Square', 'A pack of blueberry squares', 'A delicious home made pack of blueberry squares using the finest, hand-picked ingredients', 1, 5.50, 0, 2, 12)
insert into Products VALUES ('Lemon Square', 'A pack of lemon squares', 'A delicious home made pack of lemon squares using the finest, hand-picked ingredients', 1, 3.50, 0, 2, 13)
insert into Products VALUES ('Pecan Square', 'A pack of pecan squares', 'A delicious home made pack of pecan squares using the finest, hand-picked ingredients', 1, 4.50, 0, 2, 14)
insert into Products VALUES ('Peanut Butter Square', 'A pack of peanut butter squares', 'A delicious home made pack of peanut butter squares using the finest, hand-picked ingredients', 1, 5.50, 0, 2, 15)

--Cake
insert into Products VALUES ('Triple Chocolate Cake', 'A triple chocolate cake', 'A delicious home made triple chocolate cake using the finest, hand-picked ingredients', 1, 3.50, 1, 3, 16)
insert into Products VALUES ('Devils Food Cake', 'A devils food cake', 'A delicious home made devils food cake using the finest, hand-picked ingredients', 1, 4.50, 1, 3, 17)
insert into Products VALUES ('Angel Food Cake', 'A angel food cake', 'A delicious home made angel food cake using the finest, hand-picked ingredients', 1, 5.50, 0, 3, 18)
insert into Products VALUES ('Cheesecake', 'A cheesecake', 'A delicious home made cheesecake using the finest, hand-picked ingredients', 1, 4.50, 0, 3, 19)
insert into Products VALUES ('Lemon Meringue Cake', 'A lemon meringue cake', 'A delicious home made lemon meringue using the finest, hand-picked ingredients', 1, 5.50, 0, 3, 20)
insert into Products VALUES ('Black Forest Cake', 'A black forest cake', 'A delicious home made black forest using the finest, hand-picked ingredients', 1, 6.50, 0, 3, 21)
insert into Products VALUES ('Chocolate Mousse Cake', 'A chocolate mousse cake', 'A delicious home made chocolate mousse cake using the finest, hand-picked ingredients', 1, 5.50, 0, 3, 22)
insert into Products VALUES ('Pound Cake', 'A pound cake', 'A delicious home made chocolate mousse cake using the finest, hand-picked ingredients', 1, 4.50, 0, 3, 23)

--Bun
insert into Products VALUES ('White Bun', 'A white bun', 'A delicious home made package of white buns using the finest, hand-picked ingredients', 1, 3.50, 1, 4, 24)
insert into Products VALUES ('Brown Bun', 'A brown bun', 'A delicious home made package of brown buns using the finest, hand-picked ingredients', 1, 4.50, 1, 4, 25)
insert into Products VALUES ('Rye Bun', 'A rye bun', 'A delicious home made package of rye buns using the finest, hand-picked ingredients', 1, 5.50, 0, 4, 26)
insert into Products VALUES ('Sourdough Bun', 'A sourdough bun', 'A delicious home made package of sourdough buns using the finest, hand-picked ingredients', 1, 3.50, 0, 4, 27)
insert into Products VALUES ('Whole Wheat Bun', 'A whole wheat bun', 'A delicious home made package of whole wheat buns using the finest, hand-picked ingredients', 1, 4.50, 0, 4, 28)
insert into Products VALUES ('Multigrain Bun', 'A multigrain bun', 'A delicious home made package of multigrain buns using the finest, hand-picked ingredients', 1, 5.50, 0, 4, 29)

--Danish
insert into Products VALUES ('Blueberry Danish', 'A blueberry danish', 'A delicious home made box of blueberry danish using the finest, hand-picked ingredients', 1, 3.50, 1, 5, 30)
insert into Products VALUES ('Raspberry Danish', 'A raspberry danish', 'A delicious home made box of raspberry danish using the finest, hand-picked ingredients', 1, 4.50, 1, 5, 31)
insert into Products VALUES ('Strawberry Danish', 'A strawberry danish', 'A delicious home made box of strawberry danish using the finest, hand-picked ingredients', 1, 5.50, 0, 5, 32)
insert into Products VALUES ('Caramel Danish', 'A caramel danish', 'A delicious home made box of caramel danish using the finest, hand-picked ingredients', 1, 3.50, 0, 5, 33)
insert into Products VALUES ('Chocolate Danish', 'A chocolate danish', 'A delicious home made box of chocolate danish using the finest, hand-picked ingredients', 1, 4.50, 0, 5, 34)
insert into Products VALUES ('Butter Danish', 'A butter danish', 'A delicious home made box of butter danish using the finest, hand-picked ingredients', 1, 5.50, 0, 5, 35)
insert into Products VALUES ('Cream Cheese Danish', 'A cream cheese danish', 'A delicious home made box of cream cheese danish using the finest, hand-picked ingredients', 1, 4.50, 0, 5, 36)

--Muffin
insert into Products VALUES ('Blueberry Muffin', 'A blueberry muffin', 'A delicious home made box of blueberry muffin using the finest, hand-picked ingredients', 1, 3.50, 1, 6, 37)
insert into Products VALUES ('Raspberry Muffin', 'A raspberry muffin', 'A delicious home made box of raspberry muffin using the finest, hand-picked ingredients', 1, 4.50, 1, 6, 38)
insert into Products VALUES ('Strawberry Muffin', 'A strawberry muffin', 'A delicious home made box of strawberry muffin using the finest, hand-picked ingredients', 1, 5.50, 0, 6, 39)
insert into Products VALUES ('Caramel Muffin', 'A caramel muffin', 'A delicious home made box of caramel muffin using the finest, hand-picked ingredients', 1, 3.50, 0, 6, 40)
insert into Products VALUES ('Chocolate Muffin', 'A chocolate muffin', 'A delicious home made box of chocolate muffin using the finest, hand-picked ingredients', 1, 4.50, 0, 6, 41)
insert into Products VALUES ('Butter Pecan Muffin', 'A butter pecan muffin', 'A delicious home made box of butter pecan muffin using the finest, hand-picked ingredients', 1, 5.50, 0, 6, 42)

--Croissants
insert into Products VALUES ('Cheese Croissants', 'A butter cheese croissant', 'A delicious home made box of butter cheese croissant using the finest, hand-picked ingredients', 1, 3.50, 1, 7, 43)
insert into Products VALUES ('Butter Croissants', 'A butter croissant', 'A delicious home made box of butter croissant using the finest, hand-picked ingredients', 1, 4.50, 1, 7, 44)
insert into Products VALUES ('Chocolate Croissants', 'A chocolate croissant', 'A delicious home made box of chocolate croissant using the finest, hand-picked ingredients', 1, 5.50, 0, 7, 45)
insert into Products VALUES ('Almond Croissants', 'A almond croissant', 'A delicious home made box of almond croissant using the finest, hand-picked ingredients', 1, 3.50, 0, 7, 46)
insert into Products VALUES ('Ham and Cheese Croissants', 'A ham and cheese croissant', 'A delicious home made box of ham and cheese croissant using the finest, hand-picked ingredients', 1, 4.50, 0, 7, 47)
insert into Products VALUES ('Bacon Croissants', 'A bacon croissant', 'A delicious home made box of bacon croissant using the finest, hand-picked ingredients', 1, 5.50, 0, 7, 48)

--Donuts
insert into Products VALUES ('Blueberry Filled Donuts', 'A blueberry filled donut', 'A delicious home made box of blueberry filled donut using the finest, hand-picked ingredients', 1, 3.50, 1, 8, 49)
insert into Products VALUES ('Raspberry Filled Donuts', 'A raspberry filled donut', 'A delicious home made box of raspberry filled donut using the finest, hand-picked ingredients', 1, 4.50, 1, 8, 50)
insert into Products VALUES ('Strawberry Filled Donuts', 'A strawberry filled donut', 'A delicious home made box of strawberry filled donut using the finest, hand-picked ingredients', 1, 3.50, 0, 8, 51)
insert into Products VALUES ('Caramel Donuts', 'A caramel donut', 'A delicious home made box of caramel donut using the finest, hand-picked ingredients', 1, 4.50, 0, 8, 52)
insert into Products VALUES ('Chocolate Glazed Donuts', 'A chocolate glazed donut', 'A delicious home made box of chocolate glazed donut using the finest, hand-picked ingredients', 1, 5.50, 0, 8, 53)
insert into Products VALUES ('Sugar Donuts', 'A sugar donut', 'A delicious home made box of sugar donut using the finest, hand-picked ingredients', 1, 3.50, 0, 8, 54)
insert into Products VALUES ('Boston Cream Donuts', 'A boston cream donut', 'A delicious home made box of boston cream donut using the finest, hand-picked ingredients', 1, 4.50, 0, 8, 55)
GO

insert into adminLogin VALUES ('wolfe.winters@gmail.com', 'admin');
insert into adminLogin VALUES ('poirier_justin@hotmail.com', 'admin');
insert into adminLogin VALUES ('samuelthile@gmail.com', 'admin');
GO
insert into Cart VALUES (getdate(), getdate(), 1, null);
GO
insert into CartItems VALUES (1, 1001, 1, 3.50, null, 'AV');
GO
insert into Customers VALUES ('test@test.com', 'admin', 'admin', 'test', 'test', '(902) 456-7894', 't', 'testverificationtoken', 1, 0);
insert into Customers VALUES ('doop@test.com', 'admin2', 'admin', 'Bob', 'Billy', '(902) 456-1231', 'R', 'testverificationtoken', 1, 0);
insert into Customers VALUES ('test@test.com', 'sala1', 'admin', 'John', 'Salazar', '(902) 425-4564', 'Q', 'testverificationtoken', 1, 0);
insert into Customers VALUES ('test@test.com', 'raine', 'admin', 'Miranda', 'Raine', '(902) 456-7159', 'M', 'testverificationtoken', 1, 0);
GO
insert into Addresses VALUES ('123 Fake Street', 'FakeCity', 'FakeProv', 'Canada', 'E1C7W9', 'Billing', 1, GETDATE(), null);
insert into Addresses VALUES ('123 Fake Street', 'FakeCity', 'FakeProv', 'Canada', 'E1C7W9', 'Billing', 2, GETDATE(), null);
insert into Addresses VALUES ('123 Fake Street', 'FakeCity', 'FakeProv', 'Canada', 'E1C7W9', 'Billing', 3, GETDATE(), null);
insert into Addresses VALUES ('123 Fake Street', 'FakeCity', 'FakeProv', 'Canada', 'E1C7W9', 'Billing', 4, GETDATE(), null);
GO


--Keyword Search ALL
DROP PROCEDURE IF EXISTS dbo.KeywordSearchProducts
GO
DROP PROCEDURE IF EXISTS dbo.KeywordSearchProductsAll
GO

CREATE PROCEDURE KeywordSearchProductsAll
    @Word1 VARCHAR(50) = NULL,
    @Word2 VARCHAR(50) = NULL,
    @Word3 VARCHAR(50) = NULL,
    @Word4 VARCHAR(50) = NULL,
    @Word5 VARCHAR(50) = NULL
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    -- 1 is true, 0 is false.   OR  Any Words is 0, All words is 1
    SET NOCOUNT ON;
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    DECLARE @WordCount int =0;
    IF @Word1 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word2 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word3 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word4 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @Word5 IS NOT NULL
		SET @WordCount = @WordCount + 1
    IF @WordCount=1
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				Return
		END
	ELSE 
	IF @WordCount=2
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
				Return
		END
	ELSE 
		IF @WordCount=3
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
				Return
		END
	ELSE 
		IF @WordCount=4
		BEGIN
			SELECT
				SiteImages.imageId,
				imageName,
				imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
				AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 1)
			UNION
				SELECT
				SiteImages.imageId,
				imageName,
				@tempURL AS imageURL,
				uploadDate,
				altText,
				approved,
				active,
				uploadedBy,
				productId,
				productName,
				briefDescription,
				fullDescription,
				statusCode,
				price,
				featured,
				categoryId
			FROM
				Products INNER JOIN
				SiteImages ON products.imageId = SiteImages.imageId
			WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
				AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
				AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
				AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 0)
				Return
		END
	ELSE 
	IF @WordCount=5
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 1)
        AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
        AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
        AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 1)
        AND((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 1)
	UNION
	    SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%' ) AND active = 0)
        AND((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
        AND((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
        AND((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 0)
        AND((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 0)
    Return
END
GO


--Keyword Search Any
DROP PROCEDURE IF EXISTS dbo.KeywordSearchProductsAny
GO

CREATE PROCEDURE KeywordSearchProductsAny
    @Word1 VARCHAR(50) = NULL,
    @Word2 VARCHAR(50) = NULL,
    @Word3 VARCHAR(50) = NULL,
    @Word4 VARCHAR(50) = NULL,
    @Word5 VARCHAR(50) = NULL
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    -- 1 is true, 0 is false.   OR  Any Words is 0, All words is 1
    SET NOCOUNT ON;
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%') AND active = 1)
        OR((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 1)
        OR((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 1)
        OR((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 1)
        OR((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 1)
	UNION
    SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE ((productName like '%' + @Word1 + '%' OR briefDescription like '%' + @Word1 + '%' OR fullDescription like '%' + @Word1 + '%') AND active = 0)
        OR((productName like '%' + @Word2 + '%' OR briefDescription like '%' + @Word2 + '%' OR fullDescription like '%' + @Word2 + '%') AND active = 0)
        OR((productName like '%' + @Word3 + '%' OR briefDescription like '%' + @Word3 + '%' OR fullDescription like '%' + @Word3 + '%') AND active = 0)
        OR((productName like '%' + @Word4 + '%' OR briefDescription like '%' + @Word4 + '%' OR fullDescription like '%' + @Word4 + '%') AND active = 0)
        OR((productName like '%' + @Word5 + '%' OR briefDescription like '%' + @Word5 + '%' OR fullDescription like '%' + @Word5 + '%') AND active = 0)
END
GO


--Get Featured Products
DROP PROCEDURE IF EXISTS dbo.getFeatured
GO
CREATE PROCEDURE getFeatured
AS
BEGIN
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        featured = 1 AND
		active = 1
	UNION
	SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        featured = 1 AND
		active = 0
END
GO


--Get Categories
DROP PROCEDURE IF EXISTS dbo.getCategories
GO
CREATE PROCEDURE getCategories
AS
BEGIN
    SELECT
        *
    FROM
        Categories
    ORDER BY
        [name] ASC
END
GO


--Get Single Category
DROP PROCEDURE IF EXISTS dbo.getSingleCategory
GO
CREATE PROCEDURE getSingleCategory
    @categoryId  INT
AS
BEGIN
    SELECT
        *
    FROM
        Categories
    WHERE
        categoryId = @categoryId;
END
GO


--Get Products
DROP PROCEDURE IF EXISTS dbo.getProducts
GO
CREATE PROCEDURE getProducts
    @category INT
AS
BEGIN
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId
    FROM
        Products  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        categoryId = @category AND
		active = 1
	UNION
	SELECT
		SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		categoryId    FROM
        Products  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        categoryId = @category AND
		active = 0
END
GO


--Get Single Product
DROP PROCEDURE IF EXISTS dbo.getSingleProduct
GO
CREATE PROCEDURE getSingleProduct
    @productId  INT
AS
BEGIN
	DECLARE @tempURL VARCHAR(200)
	SET @tempURL = '~/images/placeholder.jpg'
    SELECT
        SiteImages.imageId,
		imageName,
		imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		Categories.categoryId,
		[name],
		[description]
    FROM
        Products INNER JOIN
		Categories ON Products.categoryId = Categories.categoryId  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        productId = @productId AND
		active = 1
	UNION
	    SELECT
        SiteImages.imageId,
		imageName,
		@tempURL AS imageURL,
		uploadDate,
		altText,
		approved,
		active,
		uploadedBy,
		productId,
		productName,
		briefDescription,
		fullDescription,
		statusCode,
		price,
		featured,
		Categories.categoryId,
		[name],
		[description]
    FROM
        Products INNER JOIN
		Categories ON Products.categoryId = Categories.categoryId  INNER JOIN
		SiteImages ON products.imageId = SiteImages.imageId
    WHERE
        productId = @productId AND
		active = 0;
END
GO


--Update Product
DROP PROCEDURE IF EXISTS dbo.updateProduct
GO
CREATE PROCEDURE updateProduct
    @productId          INT,
    @productName        NVARCHAR(50),
    @briefDescription   NVARCHAR(max),
    @fullDescription    NVARCHAR(max),
    @statusCode         CHAR(1),
    @price              MONEY,
    @featured           BIT,
    @categoryId         INT,
	@imageId			INT
AS
BEGIN
    UPDATE
        Products
    SET
        productName = @productName,
        briefDescription = @briefDescription,
        fullDescription = @fullDescription,
        statusCode = @statusCode,
        price = @price,
        featured = @featured,
        categoryId = @categoryId,
		imageId = @imageId
    WHERE
        productId = @productId;
END
GO


--Insert Product
DROP PROCEDURE IF EXISTS dbo.insertProduct
GO
CREATE PROCEDURE insertProduct
    @productName        NVARCHAR(50),
    @briefDescription   NVARCHAR(max),
    @fullDescription    NVARCHAR(max),
    @statusCode         CHAR(1),
    @price              MONEY,
    @featured           BIT,
    @categoryId         INT,
	@imageId			INT
AS
BEGIN
    INSERT INTO
        Products
    VALUES
        (
            @productName,
            @briefDescription,
            @fullDescription,
            @statusCode,
            @price,
            @featured,
            @categoryId,
            @imageId
        );
END
GO


--Delete Product
DROP PROCEDURE IF EXISTS dbo.deleteProduct
GO
CREATE PROCEDURE deleteProduct
    @productId  INT
AS
BEGIN
    DELETE FROM
        Products
    WHERE
        productId = @productId;
END
GO


--Update Category
DROP PROCEDURE IF EXISTS dbo.updateCategory
GO
CREATE PROCEDURE updateCategory
    @categoryId     INT,
    @name           NVARCHAR(50),
    @description    NVARCHAR(max)
AS
BEGIN
    UPDATE
        Categories
    SET
        [name] = @name,
        [description] = @description
    WHERE
        categoryId = @categoryId;
END
GO


--Insert Category
DROP PROCEDURE IF EXISTS dbo.insertCategory
GO
CREATE PROCEDURE insertCategory
    @name           NVARCHAR(50),
    @description    NVARCHAR(max)
AS
BEGIN
    INSERT INTO
        Categories
    VALUES
        (
            @name,
            @description
        );
END
GO


--Delete Category
DROP PROCEDURE IF EXISTS dbo.deleteCategory
GO
CREATE PROCEDURE deleteCategory
    @categoryId  INT
AS
BEGIN
    DELETE FROM
        Categories
    WHERE
        categoryId = @categoryId;
END
GO


--Authenticate Admin Login
DROP PROCEDURE IF EXISTS dbo.loginAdmin
GO
CREATE PROCEDURE loginAdmin
    @email		NVARCHAR(50),
    @password   NVARCHAR(15)
AS
BEGIN
        --Returns admin ID on success - Returns 0 on fail
        SELECT
            id
        FROM
            adminLogin
        WHERE
            email = @email AND
            [password] = @password
END
GO

--Authenticate Customer Login
DROP PROCEDURE IF EXISTS dbo.loginCustomer
GO
CREATE PROCEDURE loginCustomer
    @username   NVARCHAR(15),
    @password   NVARCHAR(15)
AS
BEGIN
	IF EXISTS	(	SELECT customerId
					FROM Customers
					WHERE username = @username AND [password] = @password AND verified = 1
				)
		BEGIN
			SELECT
				customerId
			FROM
				Customers
			WHERE
				username = @username AND
				[password] = @password AND
				verified = 1
		END
	IF EXISTS	(	SELECT customerId
					FROM Customers
					WHERE username = @username AND [password] = @password AND verified = 0
				)
		BEGIN
			RAISERROR('Account has not been verified',16,1)
		END
	ELSE
		RAISERROR('Login unsuccessful. No existing user with those matching credentials.', 16, 1)
END
GO

--Get cart items
DROP PROCEDURE IF EXISTS dbo.getCartItems
GO
CREATE PROCEDURE [dbo].[getCartItems]
    @cartID int
AS
BEGIN
    SELECT Products.ProductId, Products.productName , CartItems.Qty, CartItems.HistoricalPrice, Products.price, CartItems.Qty * Products.price as ItemSubtotal
    FROM Cart 
    INNER JOIN CartItems ON Cart.CartId = CartItems.CartId 
    INNER JOIN Products ON Products.productId = CartItems.ProductId
	WHERE CartItems.CartId = @cartID
END
GO


--Create Cart
DROP PROCEDURE IF EXISTS dbo.createCart
GO
CREATE PROCEDURE [dbo].[createCart] 
AS
BEGIN
	Insert INTO Cart (DateCreated, OrderStatus) Values(GETDATE(), 0)
    SELECT CAST(scope_identity() AS int)
END
GO

--Delete Cart
DROP PROCEDURE IF EXISTS dbo.deleteCart
GO
CREATE PROCEDURE [dbo].[deleteCart]
	@cartId		INT
AS
BEGIN
	DELETE FROM
		Cart
	WHERE
		cartId = @cartId;
END
GO

--Get Product Price
DROP PROCEDURE IF EXISTS dbo.getProductPrice
GO
CREATE PROCEDURE [dbo].[getProductPrice] 
	-- Add the parameters for the stored procedure here
	@prodId int

AS
BEGIN

Select price FROM Products WHERE productId = @prodId
SELECT CAST(scope_identity() AS decimal)
END
GO


--Create CartItem
DROP PROCEDURE IF EXISTS dbo.createCartItem
GO
CREATE PROCEDURE [dbo].[createCartItem] 
	-- Add the parameters for the stored procedure here
	@cartId int, 
	@prodId int,
	@price money
AS
BEGIN
Insert INTO CartItems (CartId,ProductId , Qty , HistoricalPrice) 
Values(@cartId,@prodId, 1, @price)
END
GO


--Update CartItem quantity
DROP PROCEDURE IF EXISTS dbo.updateCartItemQty
GO
CREATE PROCEDURE [dbo].[updateCartItemQty] 
    @qty int = 1,
    @prodID int, 
    @cartID int
AS
BEGIN
    IF EXISTS (SELECT ProductId FROM CartItems WHERE ProductId = @prodID and CartId = @cartID)
        UPDATE CartItems SET Qty = (@qty) WHERE ProductId = @prodID and CartId = @cartID
    IF @prodID NOT IN (SELECT ProductId FROM CartItems WHERE ProductId = @prodID and CartId = @cartID)
        BEGIN
            DECLARE @price decimal;
            SET @price = (SELECT price FROM Products WHERE productId = @prodID)
            INSERT INTO CartItems VALUES (@cartID, @prodID, @qty, @price, null, 'AV');
        END
    RETURN
END
GO

--Delete CartItem
DROP PROCEDURE IF EXISTS deleteCartItem
GO
CREATE PROCEDURE [dbo].[deleteCartItem] 
    @prodID int, 
    @cartID int
AS
BEGIN
    DELETE FROM CartItems
    Where productId=@prodID AND cartId =@cartID
END
GO

--Insert Customer Account
DROP PROCEDURE IF EXISTS dbo.insertCustomer
GO
CREATE PROCEDURE insertCustomer
    @email              NVARCHAR(50),
    @username           NVARCHAR(15),
    @password           NVARCHAR(15),
    @firstName          NVARCHAR(50),
    @lastName           NVARCHAR(50),
    @phone              NVARCHAR(14),
    @middleInitial      CHAR(1)         = null,
    @verificationToken  NVARCHAR(50),
    @street             NVARCHAR(50),
    @city               NVARCHAR(50),
    @stateProv          NVARCHAR(15),
    @country            NVARCHAR(20),
    @postalCode         NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;
	DECLARE @custID INT;
    BEGIN TRY
        BEGIN TRAN
            INSERT INTO
                Customers
            VALUES
                (
                    @email,
                    @username,
                    @password,
                    @firstName,
                    @lastName,
                    @phone,
                    @middleInitial,
                    @verificationToken,
                    0,
                    0
                );
            SET @custID = @@IDENTITY;
            INSERT INTO
                addresses
            VALUES
                (
                    @street,
                    @city,
                    @stateProv,
                    @country,
                    @postalCode,
                    'Billing',
                    @custID,
                    GETDATE(),
                    null
                );
        COMMIT TRAN
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN
    END CATCH
END
GO

--Archive Customer Accoount
DROP PROCEDURE IF EXISTS dbo.archiveCustomer
GO
CREATE PROCEDURE archiveCustomer
    @customerId     int
AS
BEGIN
    UPDATE
        Customers
    SET
        archived = 1
    WHERE
        customerId = @customerId;
END
GO

--Update Customer Account
DROP PROCEDURE IF EXISTS dbo.updateCustomer
GO
CREATE PROCEDURE updateCustomer
	@customerId			INT,
    @email              NVARCHAR(50),
    @lastName           NVARCHAR(50),
    @phone              NVARCHAR(14)
AS
BEGIN
    UPDATE
        Customers
    SET
        email = @email,
        lastName = @lastName,
        phone = @phone
	WHERE
		customerId = @customerId;
END
GO

--Update Customer Account Admin
DROP PROCEDURE IF EXISTS dbo.updateCustomerAdmin
GO
CREATE PROCEDURE updateCustomerAdmin
	@customerId			INT,
    @email              NVARCHAR(50),
    @firstName          NVARCHAR(50),
    @lastName           NVARCHAR(50),
    @phone              NVARCHAR(14),
    @middleInitial      CHAR(1)         = null,
    @archived           BIT
AS
BEGIN
    UPDATE
        Customers
    SET
        email = @email,
        firstName = @firstName,
        lastName = @lastName,
        phone = @phone,
        middleInitial = @middleInitial,
        archived = @archived
	WHERE
		customerId = @customerId;
END
GO


--Search for Customer Account
DROP PROCEDURE IF EXISTS dbo.searchCustomer
GO
CREATE PROCEDURE searchCustomer
    @choice			INT,
	@searchText		VARCHAR(50)
AS
BEGIN
    --Search by CustomerID
    IF (@choice = 0)
    BEGIN
        SELECT
            customerId,
            email,
            username,
            firstName,
            lastName,
            phone,
            middleInitial,
            verified,
            [archived]
        FROM
            Customers
        WHERE
            customerId LIKE '%' + @searchText + '%';
    END
    --Search by email address
    ELSE IF (@choice = 1)
    BEGIN
        SELECT
            customerId,
            email,
            username,
            firstName,
            lastName,
            phone,
            middleInitial,
            verified,
            [archived]
        FROM
            Customers
        WHERE
            email LIKE '%' + @searchText + '%';
    END
    --Search by Phone
    ELSE IF (@choice = 2)
    BEGIN
        SELECT
            customerId,
            email,
            username,
            firstName,
            lastName,
            phone,
            middleInitial,
            verified,
            [archived]
        FROM
            Customers
        WHERE
            phone LIKE '%' + @searchText + '%';
    END
END
GO

--Verify verification token
DROP PROCEDURE IF EXISTS dbo.verifyToken
GO
CREATE PROCEDURE verifyToken
    @verificationToken      NVARCHAR(50),
    @result                 INT OUTPUT
AS
BEGIN
    --returns 1 if token verified
    --returns 0 if token not verified
    DECLARE @tokenCount AS INT;
    SET @tokenCount =   (
                        SELECT
                            COUNT(*)
                        FROM
                            Customers
                        WHERE
                            verificationToken = @verificationToken
                        )
    IF (@tokenCount = 1)
        BEGIN
            UPDATE
                Customers
            SET
                verified = 1
            WHERE
                verificationToken = @verificationToken
            SET @result = 1
        END
    ELSE
        BEGIN
            SET @result = 0
        END
    RETURN @result
END
GO

--Check Unique Username
DROP PROCEDURE IF EXISTS dbo.checkUniqueUsername
GO
CREATE PROCEDURE checkUniqueUsername
    @username   NVARCHAR(15)
AS
BEGIN
    --returns 1 if username is not unique
    --returns 0 if username is unique
    SELECT
        COUNT(*)
    FROM
        Customers
    WHERE
        username = @username;
END
GO

--Get Full Customer Info
DROP PROCEDURE IF EXISTS dbo.getFullCustomerInfo
GO
CREATE PROCEDURE getFullCustomerInfo
    @customerId     INT
AS
BEGIN
    SELECT
        Customers.customerId, username, firstName, middleInitial, lastName, [password], phone, email, street, city, stateProv, postalCode, country, archived
    FROM
        Customers INNER JOIN
        Addresses ON Customers.customerId = Addresses.customerId
    WHERE
        Addresses.addressType = 'Billing' AND
		Customers.customerId = @customerId;
END
GO

--Get All Images
DROP PROCEDURE IF EXISTS dbo.getAllImages
GO
CREATE PROCEDURE getAllImages
AS
BEGIN
    SELECT
		imageName, imageId, imageUrl, uploadDate, altText, approved, uploadedBy, email, active
	FROM
		SiteImages INNER JOIN adminLogin ON SiteImages.uploadedBy = adminLogin.id;
END
GO

--Get Approved Images
DROP PROCEDURE IF EXISTS dbo.getApprovedImages
GO
CREATE PROCEDURE getApprovedImages
AS
BEGIN
    SELECT
		*
	FROM
		SiteImages
	WHERE
		approved = 1;
END
GO

--Get Single Image
DROP PROCEDURE IF EXISTS dbo.getSingleImage
GO
CREATE PROCEDURE getSingleImage
	@imageID	INT
AS
BEGIN
    SELECT
		imageUrl
	FROM
		SiteImages
	WHERE
		imageId = @imageID;
END
GO

--Insert Image
DROP PROCEDURE IF EXISTS dbo.insertImage
GO
CREATE PROCEDURE insertImage
	@imageName	NVARCHAR(50),
	@imageUrl	NVARCHAR(200),
	@altText	NVARCHAR(50),
	@uploadedBy	INT
AS
BEGIN
    INSERT INTO
		SiteImages
	VALUES
		(
			@imageName,
			@imageUrl,
			GETDATE(),
			@altText,
			0,
			@uploadedBy,
			1
		);
END
GO

--update image
DROP PROCEDURE IF EXISTS dbo.updateImage
GO
CREATE PROCEDURE updateImage
	@imageId	INT,
	@imageName	NVARCHAR(50),
	@altText	NVARCHAR(50),
	@active		BIT
AS
BEGIN
    UPDATE
		SiteImages
	SET
		imageName = @imageName,
		altText = @altText,
		active = @active
	WHERE
		imageId = @imageId;
END
GO

--Get Approved Images That Are Not Used
DROP PROCEDURE IF EXISTS dbo.getApprovedNotUsed
GO
CREATE PROCEDURE getApprovedNotUsed
    @ProdId        INT
AS
BEGIN
    SELECT
        *
    FROM
        SiteImages LEFT JOIN Products ON SiteImages.imageId = products.imageId
    WHERE
        (Products.imageId IS NULL AND SiteImages.approved = 1 AND SiteImages.active = 1) OR (productId = @ProdId AND SiteImages.active = 1) OR (SiteImages.ImageID = 1)
END
GO

--Delete Image
DROP PROCEDURE IF EXISTS dbo.deleteImage
GO
CREATE PROCEDURE deleteImage
	@imageId	INT
AS
BEGIN
    DELETE FROM
		SiteImages
	WHERE
		imageId = @imageId;
END
GO

--Approve Image
DROP PROCEDURE IF EXISTS dbo.approveImage
GO
CREATE PROCEDURE approveImage
	@imageId	INT,
	@adminId	INT,
	@newURL		NVARCHAR(50)
AS
BEGIN
	--returns 0 on success, returns -6 on fail...for whatever reason
	BEGIN TRY
		IF(@adminId != (SELECT uploadedBy FROM SiteImages WHERE imageId = @imageId))
			BEGIN
				UPDATE
					SiteImages
				SET
					approved = 1,
					imageUrl = @newURL
				WHERE
					imageId = @imageId;
			END
		ELSE
			THROW 50001,'Image cannot be approved by the admin who uploaded it', 1
	END TRY
	BEGIN CATCH
		PRINT 'An Error Has Occured.';
		PRINT 'Message: '+ CONVERT(VARCHAR(50),ERROR_MESSAGE());
	END CATCH
END
GO

--Search Image
DROP PROCEDURE IF EXISTS dbo.searchImages
GO
Create PROCEDURE dbo.searchImages
    @searchText        VARCHAR(50)
AS
BEGIN
    --Search by text
    BEGIN
        SELECT
        imageId, imageUrl, uploadDate, altText, approved, uploadedBy, email
        FROM
        SiteImages INNER JOIN adminLogin ON SiteImages.uploadedBy = adminLogin.id
        WHERE
            imageUrl LIKE '%' + @searchText + '%' OR imageName LIKE '%' + @searchText + '%';
    END
END
GO

--Check Image In Use
DROP PROCEDURE IF EXISTS dbo.checkImageInUse
GO
CREATE PROCEDURE dbo.checkImageInUse
    @imageId   int
AS
BEGIN
    --returns 1 if image is not unique
    --returns 0 if image is unique
    SELECT
        COUNT(*)
    FROM
        Products
    WHERE
        imageId = @imageId;
END
GO

--Insert Address
DROP PROCEDURE IF EXISTS dbo.insertAddress
GO
CREATE PROCEDURE dbo.insertAddress
    @street             NVARCHAR(50),
    @city               NVARCHAR(50),
    @stateProv          NVARCHAR(15),
    @country            NVARCHAR(20),
    @postalCode         NVARCHAR(10),
    @customerId         INT,
	@addressOutput		INT				OUTPUT,
    @additionalNo       NVARCHAR(50)     = null
AS
BEGIN
    INSERT INTO
		Addresses
	VALUES
		(
			@street,
			@city,
			@stateProv,
			@country,
			@postalCode,
			'Shipping',
			@customerId,
			GETDATE(),
			@additionalNo
		);
		SET @addressOutput = @@IDENTITY;
		RETURN @addressOutput
END
GO

--Delete Address
DROP PROCEDURE IF EXISTS dbo.deleteAddress
GO
CREATE PROCEDURE deleteAddress
	@addressId	INT
AS
BEGIN
    DELETE FROM
		Addresses
	WHERE
		addressId = @addressId;
END
GO

--Update Address
DROP PROCEDURE IF EXISTS dbo.updateAddress
GO
CREATE PROCEDURE updateAddress
    @street             NVARCHAR(50),
    @city               NVARCHAR(50),
    @stateProv          NVARCHAR(15),
    @country            NVARCHAR(20),
    @postalCode         NVARCHAR(10),
    @customerId         INT,
    @addressOutput      INT             OUTPUT,
    @additionalNo       NVARCHAR(50)     = null
AS
BEGIN
    UPDATE
        Addresses
    SET
        street = @street,
        city = @city,
        stateProv = @stateProv,
        country = @country,
        postalCode = @postalCode,
        AdditionalNo = @additionalNo,
        @addressOutput = addressId
    WHERE
        customerId = @customerId AND
        addressType = 'Billing';
    RETURN @addressOutput;
END
GO


--Check for Billing Address
DROP PROCEDURE IF EXISTS dbo.CheckForBilling
GO
CREATE PROCEDURE CheckForBilling
	@CustomerId		INT
AS
BEGIN
    SELECT
		COUNT(*)
	FROM
		Addresses
	WHERE
		customerId = @CustomerId AND addressType = 'Billing';
END
GO

--Insert Order to OrderHistory
DROP PROCEDURE IF EXISTS dbo.InsertOrder
GO
CREATE PROCEDURE InsertOrder
    @cartId             INT,
    @shippingAddress    INT,
    @payType            NVARCHAR(2),
    @authNumber         NVARCHAR(50),
    @customerId         INT
AS
BEGIN
    --DB for Debit / CR for Credit
    INSERT INTO
        OrderHistory
    VALUES
        (
        @cartId,
        @shippingAddress,
        @payType,
        @authNumber
        );

    UPDATE 
        Cart
    SET
        customerId = @customerId,
        orderDate = GETDATE()
    WHERE
        cartId = @cartId;
END
GO

--Get Order details
DROP PROCEDURE IF EXISTS dbo.getOrderDetails
GO
CREATE PROCEDURE getOrderDetails
    @authNumber        NVARCHAR(50)
AS
BEGIN
    SELECT
		*, CartItems.qty * CartItems.historicalPrice as ItemSubtotal
	FROM
		OrderHistory 
			INNER JOIN Cart ON OrderHistory.cartId = Cart.cartId 
			INNER JOIN CartItems ON Cart.cartId = CartItems.cartId
			INNER JOIN Addresses ON OrderHistory.shippingAddress = Addresses.addressId
			INNER JOIN Products ON CartItems.productId = Products.productId
    WHERE
		authNumber = @authNumber
END
GO

--Check if billing address, if not return billing address
DROP PROCEDURE IF EXISTS dbo.checkBillingReturnBilling
GO
CREATE PROCEDURE checkBillingReturnBilling
    @addressId        INT
AS
BEGIN
    DECLARE @customerId INT
    SET @customerId = (SELECT customerId FROM Addresses WHERE addressId = @addressId);

    IF 
        ((SELECT addressId FROM Addresses WHERE customerId = @customerId AND addressType = 'Billing') != @addressId)

    SELECT
        *
    FROM
        Addresses
    WHERE
        customerId = @customerId AND
        addressType = 'Billing'
END
GO

--Get Order Total
DROP PROCEDURE IF EXISTS dbo.getOrderTotal
GO
CREATE PROCEDURE getOrderTotal
    @authNumber        NVARCHAR(50)
AS
BEGIN
    SELECT
		SUM(CartItems.qty * CartItems.historicalPrice) AS GrandTotal
	FROM
		OrderHistory 
			INNER JOIN Cart ON OrderHistory.cartId = Cart.cartId 
			INNER JOIN CartItems ON Cart.cartId = CartItems.cartId
    WHERE
		authNumber = @authNumber
END
GO



--
--all cart rows
--customer id
--no billing address or personal info
--

/*
DROP PROCEDURE IF EXISTS dbo.procedureName
GO
CREATE PROCEDURE procedureName
AS
BEGIN
    procedureCodeHere
END
GO
*/