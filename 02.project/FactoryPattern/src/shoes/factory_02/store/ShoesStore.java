package shoes.factory_02.store;

import shoes.factory_02.factory.ShoesFactory;
import shoes.factory_02.shoes.Shoes;

public class ShoesStore {

	private ShoesFactory factory;

	public ShoesStore() {
		factory = new ShoesFactory();
	}

	public Shoes orderShoes(String name) {
		Shoes shoes = factory.makingShoes(name);

		shoes.prepare(); // 신발을 준비한다.
		shoes.packing(); // 신발을 포장한다.

		return shoes;
	}
}
