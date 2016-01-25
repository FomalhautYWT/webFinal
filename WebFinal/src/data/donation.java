package data;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class donation {
    private int id;
    private String idCard;
    private String name;
    private double count;
    private String time;

    public donation(int _id, String _idCard, String _name, double _count, String _time) {
        id = _id;
        idCard = _idCard;
        name = _name;
        count = _count;
        time = _time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCount(double count) {
        this.count = count;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getId() {
        return id;
    }

    public double getCount() {
        return count;
    }

    public String getIdCard() {
        return idCard;
    }

    public String getName() {
        return name;
    }

    public String getTime() {
        return time;
    }
}
