package data;

/**
 * Created by yangwentao on 2016/1/15.
 */
public class user {
    private String name;
    private String id;
    private int power;
    private String password;
    public user()
    {

    }

    public user(String u_name, String u_id, String _password, int _power) {
        name = u_name;
        id = u_id;
        password = _password;
        power = _power;
    }

    public String getName()
    {
        return this.name;
    }
    public void setName(String _name)
    {
        this.name = _name;
    }
    public String getID()
    {
        return this.id;
    }
    public void setID(String _ID)
    {
        this.id = _ID;
    }
    public int getPower()
    {
        return this.power;
    }
    public void setPower(int _level)
    {
        this.power = _level;
    }
}
