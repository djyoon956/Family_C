package shoes.factory_03.store;

import shoes.factory_03.shoes.Shoes;

public abstract class ShoesStore {
	public ShoesStore() { }

	public Shoes orderShoes(String name) {
		Shoes shoes = makeShoes(name);
		
		shoes.prepare(); // 신발을 준비한다.
		shoes.packing(); // 신발을 포장한다.

		return shoes;
	}

	// abstract method 로 자식 클래스에서 강제 구현하도록
	abstract Shoes makeShoes(String name);
}
