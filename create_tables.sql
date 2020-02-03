create table Product
(
    id_product  int auto_increment,
    reference   varchar(255),
    name        varchar(255),
    description varchar(255),
    primary key (id_product)
);

create table Pizza
(
    id_product int,
    primary key (id_product),
    foreign key (id_product) references Product (id_product)
);

create table Extra
(
    id_product int,
    price      float,
    primary key (id_product),
    foreign key (id_product) references Product (id_product)
);

create table Size
(
    id_size int auto_increment,
    size    varchar(255),
    primary key (id_size)
);

create table PizzaPrice
(
    id_product int,
    id_size    int,
    price      float,
    primary key (id_product, id_size),
    foreign key (id_product) references Pizza (id_product),
    foreign key (id_size) references Size (id_size)
);

create table Ingredient
(
    id_ingredient int auto_increment,
    name          varchar(255),
    primary key (id_ingredient)
);

create table PizzaIngredient
(
    id_pizza      int,
    id_ingredient int,
    quantity      float,
    unit          varchar(255),
    primary key (id_pizza, id_ingredient),
    foreign key (id_pizza) references Pizza (id_product),
    foreign key (id_ingredient) references Ingredient (id_ingredient)
);

create table Category
(
    id_category int auto_increment primary key,
    name        varchar(255)
);

create table ProductCategory
(
    id_product  int,
    id_category int,
    primary key (id_product, id_category),
    foreign key (id_product) references Product (id_product),
    foreign key (id_category) references Category (id_category)
);

create table City
(
    id_city  int auto_increment,
    name     varchar(255),
    zip_code varchar(255),
    primary key (id_city)
);

create table Address
(
    id_address    int auto_increment,
    street_number int,
    street        varchar(255),
    id_city       int,
    primary key (id_address),
    foreign key (id_city) references City (id_city)
);

create table Restaurant
(
    id_restaurant int auto_increment,
    name          varchar(255),
    id_address    int,
    foreign key (id_address) references Address (id_address),
    primary key (id_restaurant)
);

create table RestaurantPizza
(
    id_restaurant int,
    id_product    int,
    primary key (id_restaurant, id_product),
    foreign key (id_restaurant) references Restaurant (id_restaurant),
    foreign key (id_product) references Pizza (id_product)
);

create table RestaurantExtra
(
    id_restaurant int,
    id_product    int,
    quantity      int,
    primary key (id_restaurant, id_product),
    foreign key (id_restaurant) references Restaurant (id_restaurant),
    foreign key (id_product) references Extra (id_product)
);

create table RestaurantIngredient
(
    id_restaurant int,
    id_ingredient int,
    quantity      float,
    unit          varchar(255),
    primary key (id_restaurant, id_ingredient),
    foreign key (id_restaurant) references Restaurant (id_restaurant),
    foreign key (id_ingredient) references Ingredient (id_ingredient)
);

create table UserAccount
(
    id_user_account int auto_increment,
    email           varchar(255),
    phoneNumber     varchar(255),
    password        varchar(255),
    primary key (id_user_account)
);

create table Customer
(
    id_user_account int,
    reference       varchar(255),
    last_name       varchar(255),
    first_name      varchar(255),
    civility        varchar(255),
    primary key (id_user_account),
    foreign key (id_user_account) references UserAccount (id_user_account)
);

create table Employee
(
    id_user_account int,
    primary key (id_user_account),
    foreign key (id_user_account) references UserAccount (id_user_account)
);

create table Director
(
    id_user_account int,
    primary key (id_user_account),
    foreign key (id_user_account) references UserAccount (id_user_account)
);

create table CustomerAddress
(
    id_customer int,
    id_address  int,
    primary key (id_customer, id_address),
    foreign key (id_customer) references Customer (id_user_account),
    foreign key (id_address) references Address (id_address)
);

create table `Order`
(
    id_order       int auto_increment,
    reference      varchar(255),
    delivery_costs float,
    id_address     int,
    id_restaurant  int,
    id_customer    int,
    primary key (id_order),
    foreign key (id_address) references Address (id_address),
    foreign key (id_restaurant) references Restaurant (id_restaurant),
    foreign key (id_customer) references Customer (id_user_account)
);

create table ExtraLine
(
    id_order      int,
    id_product    int,
    quantity      int,
    unitPricePaid float,
    primary key (id_order, id_product),
    foreign key (id_order) references `Order` (id_order),
    foreign key (id_product) references Extra (id_product)
);

create table PizzaLine
(
    id_order      int,
    id_product    int,
    id_size       int,
    quantity      int,
    unitPricePaid float,
    primary key (id_order, id_product, id_size),
    foreign key (id_order) references `Order` (id_order),
    foreign key (id_product, id_size) references PizzaPrice (id_product, id_size)
);

create table Status
(
    id_status int auto_increment,
    label     varchar(255),
    primary key (id_status)
);

create table OrderStatus
(
    id_order  int,
    id_status int,
    datetime  datetime,
    primary key (id_order, id_status),
    foreign key (id_order) references `Order` (id_order),
    foreign key (id_status) references Status (id_status)
);
