package data;

/**
 * Created by yangwentao on 2016/1/17.
 */
public class rec {
    int id;
    String name;
    String p_id;
    String c_id;
    double count;
    String time;

    public rec(int _id, String _name, String _p_id, String _c_id, double _count, String _time) {
        id = _id;
        name = _name;
        p_id = _p_id;
        c_id = _c_id;
        count = _count;
        time = _time;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setP_id(String p_id) {
        this.p_id = p_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public void setCount(double count) {
        this.count = count;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getCount() {
        return count;
    }

    public int getId() {
        return id;
    }

    public String getC_id() {
        return c_id;
    }

    public String getName() {
        return name;
    }

    public String getP_id() {
        return p_id;
    }

    public String getTime() {
        return time;
    }
}
