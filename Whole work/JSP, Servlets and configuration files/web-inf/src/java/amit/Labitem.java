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
public class Labitem {
    private String lab_id;
    private String item_code;
    private String item_name;
    private int quantity;
    private float price;
    private float total;
    jdbcconnection j=new jdbcconnection();
    ArrayList a=new ArrayList();
    /**
     * @return the lab_id
     */
    public String getLab_id() {
        return lab_id;
    }

    /**
     * @param lab_id the lab_id to set
     */
    public void setLab_id(String lab_id) {
        this.lab_id = lab_id;
    }

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
        this.item_name=item_name;
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
     * @return the total
     */
    public float getTotal() {
        return total;
    }

    /**
     * @param total the total to set
     */
    public void setTotal() {
        this.total = this.price*this.quantity;
    }

    public String insertlabitem(){
        String message=new String();
        check ch=new check();
        String l=new String("','");
        String c=new String (",");
        String i=new String("'");
        System.out.print(ch.islabitem(item_code));
        System.out.print(!ch.isitem(item_code)&& ch.islab(lab_id));
        if(!ch.islabitem(item_code)&& ch.islab(lab_id)){
            int n=j.insertData("insert into lab_item values('" +
                    lab_id+l+item_code+l+item_name+i+c+price+c+quantity+c+total+")");
            if(n==1)message="New Lab Item is successful";
        }
        else{
            if(ch.islabitem(item_code)){message="Lab item already exists";}
            else if(!ch.islab(lab_id)){message=ch.getMessage();}
            }

        return message;
    }
}
