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
public class Items {
    private String item_code;
    private String item_name;
    private float price;
    private int quantity;
    private String purchase_date;
    private String company;
    private String dept_id;

    /**
     * @return the item_code
     */
    public String getItem_code() {
        return item_code;
    }

    /**
     * @param item_code the item_code to set
     */
    public void setItem_code(String item_code) {
        this.item_code = item_code;
    }

    /**
     * @return the item_name
     */
    public String getItem_name() {
        return item_name;
    }

    /**
     * @param item_name the item_name to set
     */
    public void setItem_name(String item_name) {
        this.item_name = item_name;
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
     * @return the quantity
     */
    public int getQuantity() {
        return quantity;
    }

    /**
     * @param quantity the quantity to set
     */
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    /**
     * @return the purchase_date
     */
    public String getPurchase_date() {
        return purchase_date;
    }

    /**
     * @param purchase_date the purchase_date to set
     */
    public void setPurchase_date(String purchase_date) {
        this.purchase_date = purchase_date;
    }

    /**
     * @return the company
     */
    public String getCompany() {
        return company;
    }

    /**
     * @param company the company to set
     */
    public void setCompany(String company) {
        this.company = company;
    }

    /**
     * @return the dept_id
     */
    public String getDept_id() {
        return dept_id;
    }

    /**
     * @param dept_id the dept_id to set
     */
    public void setDept_id(String dept_id) {
        this.dept_id = dept_id;
    }

    public String insertitem(){
        jdbcconnection j=new jdbcconnection();
        check ch=new check();
        String message=new String("");
        String c=new String(",");
        String i=new String("'");
        String l=new String("','");
        if(!ch.isitem(item_code)&& ch.isdepartment(dept_id))
        {
            int n=j.insertData("insert into items values('" +
                    item_code+l+item_name+i+c+price+c+quantity+c
                    +i+purchase_date+l+company+l+dept_id+i+")");
            if(n==1)message="New Item Entry is successful";
        }
        else
        {
            if(ch.isitem(item_code))message="Item already exists";
            else if(!ch.isdepartment(dept_id))message=ch.getMessage();
        }
        return message;
    }

    public void getitem(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select * from items where item_code='"+this.item_code+"'");
        this.item_name=a.get(0).toString();
        this.price=Float.parseFloat(a.get(2).toString());
        this.quantity=Integer.parseInt(a.get(3).toString());
        this.purchase_date=a.get(4).toString();
        this.company=a.get(5).toString();
        this.dept_id=a.get(6).toString();
    }

    public int countitem(){
        jdbcconnection j=new jdbcconnection();
        ArrayList a=new ArrayList();
        a=j.getData("select item_code from items");
        return(a.size());
    }
}
