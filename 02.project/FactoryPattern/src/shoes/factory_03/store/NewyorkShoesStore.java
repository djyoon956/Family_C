package shoes.factory_03.store;

import shoes.factory_03.shoes.Shoes;
import shoes.factory_03.shoes.newyork.NYStyleBlackShoes;
import shoes.factory_03.shoes.newyork.NYStyleBrownShoes;
import shoes.factory_03.shoes.newyork.NYStyleRedShoes;

public class NewyorkShoesStore extends ShoesStore {

	@Override
	public Shoes makeShoes(String name) {
		if (name.equals("blackShoes")) {
			return new NYStyleBlackShoes();

		} else if (name.equals("brownShoes")) {

			return new NYStyleBrownShoes();

		} else if (name.equals("redShoes")) {

			return new NYStyleRedShoes();

		} else {

			return null;
		}
	}

}
