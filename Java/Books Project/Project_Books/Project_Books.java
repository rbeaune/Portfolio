/*
 Program: Project_Books: main
 Author: Raymond Beaune
 */

public class Project_Books {

	public static void main(String[] args) {
		
		BooksView theView = new BooksView();
		DbUtils theModel = new DbUtils();
		
		BooksController theController = new BooksController(theView, theModel);
		
		theView.setVisible(true);
	}

}
