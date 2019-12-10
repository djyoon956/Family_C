package shoes.factory_01.shoes;

public class Shoes {
	protected String name;
	protected String bottom;
	protected String leather;

	public void prepare() {
		System.out.println("완성된 신발을 준비 중 입니다..");
	}

	public void packing() {
		System.out.println("신발을 포장 하고 있습니다..");
	}

	@Override
	public String toString() {
		return "Shoes [name=" + name + ", bottom=" + bottom + ", leather=" + leather + "]";
	}
}
