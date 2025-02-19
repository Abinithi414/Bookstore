using BooksService as service from '../../srv/services';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'title',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Orders',
            Label : 'Orders',
            Target : orders.@UI.LineItem
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'Authors',
            Label : 'Authors',
            Target : Mapping.@UI.LineItem
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'title',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : 'stock',
            Value : stock,
        },
    ],
    UI.SelectionFields : [
        title
    ],
);

// annotate service.Books with {
//     author @Common.ValueList : {
//         $Type : 'Common.ValueListType',
//         CollectionPath : 'Authors',
//         Parameters : [
//             {
//                 $Type : 'Common.ValueListParameterInOut',
//                 LocalDataProperty : author_ID,
//                 ValueListProperty : 'ID',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'firstname',
//             },
//             {
//                 $Type : 'Common.ValueListParameterDisplayOnly',
//                 ValueListProperty : 'lastname',
//             },
//         ],
//     }
// };
annotate service.Orders with {

    code
    @Common : { 
        Label : 'code',
     };

     cost
     @Common : { 

        Label : 'cost',
      };

      quantity
      @Common : { 

        Label : 'quantity',
       };




}

annotate service.Orders with @(

        UI.HeaderInfo:{
        TypeName : 'Order',
        TypeNamePlural: 'Orders',
    
       },

       UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'code',
            Value : code,
        },
        {
            $Type : 'UI.DataField',
            Label : 'cost',
            Value : cost,
        },
        {
            $Type : 'UI.DataField',
            Label : 'quantity',
            Value : quantity,
        },
    ],


    



);
 annotate  service.Books with {

    ID 
    @UI.HiddenFilter
    @Common : { 

        Label : 'ID',
     };

     author
     @UI.HiddenFilter

    

 }

 annotate service.Books with @(


    UI.HeaderInfo:{
        TypeName : 'Book',
        TypeNamePlural: 'Books',
       Title: {
        Value: title
       },
       Description: {
        Value: ID
       }

    }

 );

 annotate service.Mapping with @(

        

       UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'firstname',
            Value : author.firstname,
        },
        {
            $Type : 'UI.DataField',
            Label : 'lastname',
            Value : author.lastname,
        },
    ],


    



);

 