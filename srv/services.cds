using { sap.capire.bookstore as db } from '../db/schema';

// Define Books Service
service BooksService {
    
    entity Books as projection   on db.Books { * } excluding { category, createdBy, createdAt, modifiedBy, modifiedAt };
    @readonly entity Authors as projection on db.Authors;
    entity Orders as projection on db.Orders;
    entity Mapping as projection on db.BookAuthors;
    
}
annotate BooksService.Books with @odata.draft.enabled;

// Define Orders Service
service OrdersService {
    entity Orders as projection on db.Orders;
    entity OrderItems as projection on db.OrderItems;
}

// Reuse Admin Service
// using { AdminService } from '@sap/capire-products';
// extend service AdminService with {
//     entity Authors as projection on db.Authors;
// }

