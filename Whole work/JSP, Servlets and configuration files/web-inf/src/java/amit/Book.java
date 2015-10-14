/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;
import java.util.ArrayList;
/**
 *
 * @author Amit
 */
public class Book {
        private String book_id="";
        private String book_name="";
        private String type="";
        private float price;
        private String publisher="";
        private String author="";
        private String section;
        private String shelf_no;
        private String status="On shelf";
      

    /**
     * @return the book_id
     */
    public String getBook_id() {
        return book_id;
    }

    /**
     * @param book_id the book_id to set
     */
    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    /**
     * @return the book_name
     */
    public String getBook_name() {
        return book_name;
    }

    /**
     * @param book_name the book_name to set
     */
    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    /**
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * @return the author
     */
    public String getAuthor() {
        return author;
    }

    /**
     * @param author the author to set
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     * @return the section
     */
    public String getSection() {
        return section;
    }

    /**
     * @param section the section to set
     */
    public void setSection(String section) {
        this.section = section;
    }

    /**
     * @return the shelf_no
     */
    public String getShelf_no() {
        return shelf_no;
    }

    /**
     * @param shelf_no the shelf_no to set
     */
    public void setShelf_no(String shelf_no) {
        this.shelf_no = shelf_no;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    

    public String insertbook(){
        String message=new String();
        jdbcconnection j= new jdbcconnection();
        String l=new String("','");
        String i=new String("'");
        String c=new String (",");
        check ch =new check();
        if(!ch.isbook(book_id)){
            j.insertData("insert into library_book values ('" +
                    book_id+l+book_name+l+type+i+c+price+c+i+publisher+l+author+l+section+
                    l+shelf_no+l+status+i+")");
            message="New Book Entry is successful";
        }
        else{
            if(ch.isbook(book_id)){message="Book already exists";}
        }
        return message;
    }

    /*public String updatebook(){
        String message=new String();
        jdbcconnection j= new jdbcconnection();
        String l=new String("','");
        String i=new String("'");
        String c=new String (",");
        check ch =new check();
        if(!ch.isbook(book_id)){message=ch.getMessage();}
        else
        {
            j.insertData("update library_book set book_name='"+book_name
                    +i+c+"type='"+type+i+c+"price="+price+c+"publisher='"+publisher
                    +i+c+"author='"+author+i+c+"description='"+description+i+"where book_id='"+book_id+i);
            message="Update Successful";
        }
        return message;
    }*/

    public void getbook()
    {
        jdbcconnection j= new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select * from libray_book where book_id='"+book_id+"'");
        //this.book_id=a.get(0).toString();
        this.book_name=a.get(1).toString();
        this.type=a.get(2).toString();
        this.price=Float.parseFloat(a.get(3).toString());
        this.publisher=a.get(4).toString();
        this.author=a.get(5).toString();
        this.section=a.get(6).toString();
        this.shelf_no=a.get(7).toString();
        this.status=a.get(8).toString();

    }

    public int countbook(){
        jdbcconnection j =new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select book_id from library_book");
        return(a.size());
    }

    public ArrayList search(String keyword,String type)
    {
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select book_name,book_id from library_book where"+type+ "like '"+keyword+"%'");
        return a;
    }


}
