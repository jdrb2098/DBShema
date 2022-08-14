CREATE TABLE "Product"(
    "id" INTEGER NOT NULL,
    "User" INTEGER NOT NULL,
    "Name" CHAR(255) NOT NULL,
    "Image" CHAR(255) NOT NULL,
    "Brand" CHAR(255) NOT NULL,
    "Category" CHAR(255) NOT NULL,
    "Description" CHAR(255) NOT NULL,
    "Rating" INTEGER NOT NULL,
    "NumReviews" INTEGER NOT NULL,
    "Price" DECIMAL(8, 2) NOT NULL,
    "CountInStock" INTEGER NOT NULL,
    "CreatedAt" DATE NOT NULL
);
ALTER TABLE
    "Product" ADD PRIMARY KEY("id");
CREATE TABLE "User"(
    "id" INTEGER NOT NULL,
    "Username" CHAR(255) NOT NULL,
    "FirstName" CHAR(255) NOT NULL,
    "LastName" CHAR(255) NOT NULL,
    "Email" CHAR(255) NOT NULL,
    "Password" CHAR(255) NOT NULL,
    "Is_Staff" BOOLEAN NOT NULL,
    "Is_Active" BOOLEAN NOT NULL,
    "Is_superuser" BOOLEAN NOT NULL
);
ALTER TABLE
    "User" ADD PRIMARY KEY("id");
CREATE TABLE "OrderItem"(
    "id" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "Product" INTEGER NOT NULL,
    "Name" CHAR(255) NOT NULL,
    "Qty" INTEGER NOT NULL,
    "Price" DECIMAL(8, 2) NOT NULL,
    "image" CHAR(255) NOT NULL
);
ALTER TABLE
    "OrderItem" ADD PRIMARY KEY("id");
CREATE TABLE "Order"(
    "id" INTEGER NOT NULL,
    "User" INTEGER NOT NULL,
    "PaymentMethod" CHAR(255) NOT NULL,
    "TaxPrice" DECIMAL(8, 2) NOT NULL,
    "ShippingPrice" DECIMAL(8, 2) NOT NULL,
    "TotalPrice" DECIMAL(8, 2) NOT NULL,
    "IsPaid" BOOLEAN NOT NULL,
    "PaidAt" DATE NOT NULL,
    "IsDelivered" BOOLEAN NOT NULL,
    "DeliveredAt" DATE NOT NULL,
    "CreatedAt" DATE NOT NULL
);
ALTER TABLE
    "Order" ADD PRIMARY KEY("id");
CREATE TABLE "ShippingAddress"(
    "id" INTEGER NOT NULL,
    "Order" INTEGER NOT NULL,
    "Address" CHAR(255) NOT NULL,
    "City" CHAR(255) NOT NULL,
    "PostalCode" CHAR(255) NOT NULL,
    "Country" CHAR(255) NOT NULL,
    "ShippingPrice" DECIMAL(8, 2) NOT NULL
);
ALTER TABLE
    "ShippingAddress" ADD PRIMARY KEY("id");
CREATE TABLE "Review"(
    "id" INTEGER NOT NULL,
    "User" INTEGER NOT NULL,
    "Product" INTEGER NOT NULL,
    "Name" CHAR(255) NOT NULL,
    "Rating" INTEGER NOT NULL,
    "Comment" CHAR(255) NOT NULL,
    "CreatedAt" DATE NOT NULL
);
ALTER TABLE
    "Review" ADD PRIMARY KEY("id");
ALTER TABLE
    "OrderItem" ADD CONSTRAINT "orderitem_product_foreign" FOREIGN KEY("Product") REFERENCES "Product"("id");
ALTER TABLE
    "OrderItem" ADD CONSTRAINT "orderitem_order_foreign" FOREIGN KEY("order") REFERENCES "Order"("id");
ALTER TABLE
    "ShippingAddress" ADD CONSTRAINT "shippingaddress_order_foreign" FOREIGN KEY("Order") REFERENCES "Order"("id");
ALTER TABLE
    "Review" ADD CONSTRAINT "review_product_foreign" FOREIGN KEY("Product") REFERENCES "Product"("id");
ALTER TABLE
    "Product" ADD CONSTRAINT "product_user_foreign" FOREIGN KEY("User") REFERENCES "User"("id");
ALTER TABLE
    "Review" ADD CONSTRAINT "review_user_foreign" FOREIGN KEY("User") REFERENCES "User"("id");
ALTER TABLE
    "Order" ADD CONSTRAINT "order_user_foreign" FOREIGN KEY("User") REFERENCES "User"("id");