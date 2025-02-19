namespace sap.capire.bookstore;

using { Currency, cuid, managed }      from '@sap/cds/common';
//using { sap.capire.products.Products } from '@sap/capire-products';

// entity Books as projection on Products; extend Products with {
//     // Note: we map Books to Products to allow reusing AdminService as is
//     author : Association to Authors;
// }

entity Books : cuid {
    // Note: we map Books to Products to allow reusing AdminService as is
   key ID: Integer;
    title  : String(100);
    stock   : Int16;
    orders : Composition of  many Orders on orders.books=$self;
    Mapping: Association to many BookAuthors on Mapping.book = $self;
}

entity Authors : cuid {
    firstname : String(111);
    lastname  : String(111);
   // books     : Association to many Books on books.author = $self;
}

@Capabilities.Updatable: false
entity Orders : cuid, managed {
    // items    : Composition of many OrderItems on items.parent = $self;
    // total    : Decimal(9,2) @readonly;
    // currency : Currency;
    key code : Integer;
    cost : Integer;
    quantity: Integer;
    books : Association to Books;
}

@Capabilities.Updatable: false
entity OrderItems : cuid {
    parent    : Association to Orders not null;
    book_ID   : UUID;
    amount    : Integer;
    netAmount : Decimal(9,2) @readonly;
}

entity BookAuthors {

    key ID: Integer;
    author: Association to Authors;
    book: Association to  Books;
}
