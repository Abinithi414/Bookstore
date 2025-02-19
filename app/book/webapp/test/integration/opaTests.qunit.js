sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'sap/capire/bookstore/book/test/integration/FirstJourney',
		'sap/capire/bookstore/book/test/integration/pages/BooksList',
		'sap/capire/bookstore/book/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('sap/capire/bookstore/book') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);