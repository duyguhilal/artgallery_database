
CREATE DATABASE if not exists db_artgallery;
use  db_artgallery;

CREATE TABLE if not exists artists (
    ArtistID INT PRIMARY KEY,
    ArtistName VARCHAR(255),
    ArtistSurname VARCHAR(255),
    BirthDate VARCHAR(255),
    DeathDate VARCHAR(255),
    Country VARCHAR(50),
    Sex VARCHAR(50)
);

  CREATE TABLE if not exists artworks (
    ArtworkID INT PRIMARY KEY,
    ArtName VARCHAR(255) NOT NULL,
    Current_trend VARCHAR(255) NOT NULL,
    Size VARCHAR(255) NOT NULL,
    Creation_date VARCHAR(255) NOT NULL,
    Price DECIMAL(10 , 2 ) NOT NULL,
    ArtistID INT NOT NULL,
    CONSTRAINT fk_artist_id FOREIGN KEY (ArtistID)
        REFERENCES artists (ArtistID)
);
      
CREATE TABLE if not exists customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    SurName VARCHAR(255),
    Email VARCHAR(255),
    Phone VARCHAR(15),
    Adress VARCHAR(255),
    ArtworkID INT,
    CONSTRAINT fk_artwork_id FOREIGN KEY (ArtworkID)
        REFERENCES artworks (ArtworkID)
);

CREATE TABLE if not exists sales (
    SaleID INT PRIMARY KEY,
    ArtworkID INT,
    CustomerID INT,
    SaleDate VARCHAR(255),
    SaleAmount DECIMAL(10 , 2 ),
    CONSTRAINT fk_artwork_id_sales FOREIGN KEY (ArtworkID)
        REFERENCES artworks (ArtworkID),
    CONSTRAINT fk_customer_id_sales FOREIGN KEY (CustomerID)
        REFERENCES customers (CustomerID)
);
CREATE TABLE if not exists gallery (
    GalleryID INT PRIMARY KEY,
    GalleryName VARCHAR(255),
    Location VARCHAR(255),
	ArtworkID INT ,
 CONSTRAINT fk_artwork_id_gallery
    FOREIGN KEY (ArtworkID)
    REFERENCES artworks (ArtworkID)
    );


CREATE TABLE if not exists exhibitions (
    ExhibitionID INT PRIMARY KEY,
    ExhibitionName VARCHAR(255),
    StartDate DATE,
    EndDate DATE,
    GalleryID INT,
    CONSTRAINT fk_gallery_id FOREIGN KEY (GalleryID)
        REFERENCES gallery(GalleryID)
);

CREATE TABLE if not exists painting_exhibition (
    ExhibitionID INT PRIMARY KEY,
    PaintType VARCHAR(50),
    CONSTRAINT fk_painting_exhibition_id FOREIGN KEY (ExhibitionID)
        REFERENCES exhibitions (ExhibitionID)
);

CREATE TABLE if not exists sculpture_exhibition (
    ExhibitionID INT PRIMARY KEY,
    SculptureMaterial VARCHAR(50),
    SculptureStyle VARCHAR(50),
    CONSTRAINT fk_sculpture_exhibition_id FOREIGN KEY (ExhibitionID)
        REFERENCES exhibitions (ExhibitionID)
);
CREATE TABLE if not exists antique_exhibition (
    ExhibitionID INT PRIMARY KEY,
    AntiqueEra VARCHAR(50),
    CONSTRAINT fk_antique_exhibition_id FOREIGN KEY (ExhibitionID)
        REFERENCES exhibitions(ExhibitionID)
        );
        

INSERT INTO Artists (ArtistID, ArtistName, ArtistSurname, BirthDate, DeathDate, Country, Sex) 
VALUES
(1,'Claude ','Monet','1840-05-02','1926-06-04','French', 'M'),
(2,'Edward','Munch','1863','1944','Norwegian', 'M'),
(3,'Anton Von','Werner','1843','1915','Germany', 'M'),
(4,'Amedeo  ','Modigliani','1984', '1920','Italian', 'M'),
(5,'Antonio da ', 'Correggio','1489','1534','Italian', 'M'),
(6,'Charles  ', 'Le Brun ','1619','1960','French', 'M'),
(7,'Edward', 'Hicks','1780','1849', 'American', 'M'),
(8,'Edward Mitchell', ' Bannister ','1828','1901','American', 'M'),
(9,'Frida', 'Kahlo', '1907', '1954', 'Mexico', 'F'),
(10, 'Gustave', 'Courbet', '1819' ,'1877', 'French' , 'M'),
(11, 'Hans' , 'Hofmann', '1880' ,'1966' , 'German' , 'M'),
( 12, 'Isaac' , 'Levitan' , '1860', '1900' ,'Russian' , 'M'),
( 13, 'Ilya' , 'Repin' , '1844', '1930' ,'Russian' , 'F'),
( 14, 'Juan' , 'Gris' , '1887', '1927' ,'Spain' , 'M'),
(15, 'Michelangelo', 'Buonarroti', '1475', '1564', 'Italy', 'M');



INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (1, 'Sunrise' , 1, 'Impression', '1872','50*70',100.000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (2, 'Water Lilies ' , 1, 'Impression','1897', '50*70', 110.000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (3, 'The Vampire ' , 2, 'Sembolist','1893', '60*80', 225.000,100148); 
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (4, 'The Scream ' , 2, 'Sembolist', '1893','70*80', 122.000,100148); 
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (5, 'Proclamation of the German Empire  ' , 3, 'Impression', '1871','100*110', 300.000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (6, 'Woman with a Red Necklace ' , 4, 'Realism', '1917','100*110', 320.000,100148 );
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (7, 'Jupiter and Io ' , 5, 'Surrealism',  '1530', '55*60',400.000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID , Current_trend, Creation_date , Size , Price,GalleryID)
VALUES (8, 'Apollon ve Thémas ' , 6, 'Impression', '1663', '65*90', 250.000,100148); 
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (9, 'The Peaceable Kingdom', 7, 'Realist', '1830', '150x100', 8000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (10, 'Under the Oaks, Rhode Island', 8, 'Impressionist', '1875', '200x150', 12000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (11, 'The Two Fridas', 9, 'Surrealist', '1930', '80x60', 15000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (12, 'The Artist''s Studio', 10, 'Realist', '1855', '180x120', 9500,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (13, 'Composition', 11, 'Abstract', '1950', '120x90', 8500,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (14, 'Above Eternal Peace', 12, 'Impressionist', '1885', '100x80', 7000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (15, 'Reply of the Zaporozhian Cossacks', 12, 'Realist', '1890', '200x150', 9000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (16, 'Man in the Café', 14, 'Cubist', '1927', '60x40', 11000,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (17, 'Man in a Cafe', 14, 'Cubist', '1920-01-01', '127.6x88.3', 9500,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (18, 'Still Life with Flowers', 14, 'Cubist', '1925-06-12', '112.1x70.2', 8200,100148);
INSERT INTO Artworks (ArtworkID, ArtName, ArtistID, Current_trend, Creation_date, Size, Price,GalleryID)
VALUES (19, 'David', 15, 'Renaissance', '1501', '520x230', 25000,100148);



-- Sanat Eserleri - Müşteriler ilişkisi
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (1, 'Edward', 'Cullen', 'edwardcullen@gmail.com', '123-456-7890', 'New York',6);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID) 
VALUES (2, 'Akgun', 'Taskın', 'akgungokalp@gmail.com', '541-467-83-39', 'Izmir',11);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (3, 'Dylan', 'OBrien', 'dylanobrien@hotmail.com', '112-622-3367', 'Chicago',5);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (3, 'Dylan', 'OBrien', 'dylanobrien@hotmail.com', '112-622-3367', 'Chicago',9);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (4, 'Metin', 'Akdulger', 'metinakdulger@gmail.com', '532-123-4927', 'Istanbul',10);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (5, 'Melek', 'Uzun', 'meljun3467@gmail.com', '542-784-4683', 'Viyana',4);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (6, 'Elcin ', 'Sangu', 'elcinsangu@gmail.com', '777-888-9999', 'Ankara',13);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (7, 'Ömer', 'İplikçi', 'omeriplikci@hotmail.com', '534-572-4465', 'Sarıyer',1);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (8, 'Cansu', 'Kartal', 'cansukartal05@gmail.com', '537-827-9877', 'Roma',7);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (9, 'Harry', 'Potter', 'harryninhedwigi@gmail.com', '999-888-7777', 'Hogwarts',3);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (10, 'Sophia', 'Moore', 'sophia.moore@example.com', '666-444-5555', 'Denver',2);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (11, 'Beyzanur', 'Kanbay', 'beyza.mavi61@gmail.com', '721-455-6689', 'Oslo',14);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress, ArtworkID)
VALUES (12, 'Theo', 'James', 'uyumsuz@gmail.com', '777-999-1111', 'Paris',15);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress ,ArtworkID)
VALUES (13, 'Noah', 'White', 'noah.white@example.com', '333-222-1111', 'Dallas',12);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, Adress ,ArtworkID)
VALUES(14, 'Duygu', 'Cetin', 'cetinduyguhilal.com', '888-777-6666', 'Newyork',13);
INSERT INTO Customers (CustomerID, Name, SurName, Email, Phone, ArtworkID)
VALUES (15, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 'Brooklyn', 8);



INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (1, 6, 1, '2023-05-20', 27.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (2, 11, 2, '2023-07-02', 100.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (3, 5, 3, '2023-07-10', 100.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (4, 9, 3, '2023-08-05', 75.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (5, 10, 4, '2023-09-12', 25.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (6, 4, 5, '2023-10-22', 60.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (7, 16, 6, '2023-11-18', 80.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (8, 1, 7, '2023-12-04', 75,00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (9, 7, 8, '2023-12-22', 60,00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (10, 3, 9, '2024-01-10', 70.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (11, 2, 10, '2024-02-05', 40.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (12, 14, 11, '2024-03-18', 90.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (13, 15, 12, '2024-04-22', 110.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (14, 12, 13, '2024-05-15', 50.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (15, 13, 14, '2023-03-15', 80.00);
INSERT INTO Sales (SaleID, ArtworkID, CustomerID, SaleDate, SaleAmount)
VALUES (16, 8, 15, '2024-06-20', 50.00);




INSERT INTO Gallery (GalleryID, GalleryName, Location, ArtworkID)
VALUES 
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 1),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 2),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 3),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 4),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 5),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 6),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 7),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 8),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 9),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 10),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 11),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 12),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 13),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 14),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 15),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 16),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 17),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 18),
(100148, 'Moon Art Gallery', 'Bostanlı,IZMIR', 19);




INSERT INTO exhibitions (ExhibitionID, ExhibitionName, StartDate, EndDate, GalleryID)
VALUES (1, 'Modern Art Showcase', '2024-08-01', '2024-10-01', 100148);


INSERT INTO painting_exhibition (ExhibitionID, PaintType)
VALUES (1, 'Oil');


INSERT INTO sculpture_exhibition (ExhibitionID, SculptureMaterial, SculptureStyle)
VALUES (1, 'Bronze', 'Abstract');

INSERT INTO antique_exhibition (ExhibitionID, AntiqueEra)
VALUES (1, 'Ancient');


INSERT INTO exhibitions (ExhibitionID, ExhibitionName, StartDate, EndDate, GalleryID)
VALUES (2, 'Renaissance Masterpieces', '2024-11-01', '2025-01-01', 100148);


INSERT INTO painting_exhibition (ExhibitionID, PaintType)
VALUES (2, 'Watercolor');


INSERT INTO sculpture_exhibition (ExhibitionID, SculptureMaterial, SculptureStyle)
VALUES (2, 'Marble', 'Realistic');


INSERT INTO antique_exhibition (ExhibitionID,  AntiqueEra)
VALUES (2, 'Renaissance');


INSERT INTO exhibitions (ExhibitionID, ExhibitionName, StartDate, EndDate, GalleryID)
VALUES (3, 'Ancient Artifacts', '2025-03-01', '2025-06-01', 100148);

INSERT INTO painting_exhibition (ExhibitionID, PaintType)
VALUES (3, 'Fresco');

INSERT INTO sculpture_exhibition (ExhibitionID, SculptureMaterial, SculptureStyle)
VALUES (3, 'Stone', 'Primitive');

INSERT INTO antique_exhibition (ExhibitionID, AntiqueEra)
VALUES (3, '1850');

INSERT INTO exhibitions (ExhibitionID, ExhibitionName, StartDate, EndDate, GalleryID)
VALUES (4, 'Abstract Expressions', '2025-07-01', '2025-09-01', 100148);

INSERT INTO sculpture_exhibition (ExhibitionID, SculptureMaterial, SculptureStyle)
VALUES (4, 'Metal', 'Abstract');


INSERT INTO exhibitions (ExhibitionID, ExhibitionName, StartDate, EndDate, GalleryID)
VALUES (5, 'Minimalist Art', '2025-10-01', '2025-12-01', 100148);

INSERT INTO painting_exhibition (ExhibitionID, PaintType)
VALUES (5, 'Monochrome');

INSERT INTO antique_exhibition (ExhibitionID, AntiqueEra)
VALUES (5, '1940');
