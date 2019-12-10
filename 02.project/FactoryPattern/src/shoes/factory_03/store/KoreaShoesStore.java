package shoes.factory_03.store;

import shoes.factory_03.shoes.BlueShoes;
import shoes.factory_03.shoes.Shoes;
import shoes.factory_03.shoes.france.FRStyleBlackShoes;
import shoes.factory_03.shoes.france.FRStyleBrownShoes;
import shoes.factory_03.shoes.france.FRStyleRedShoes;

public class KoreaShoesStore extends ShoesStore {

	@Override
	public Shoes makeShoes(String name) {
		if (name.equals("blackShoes")) {
			return new FRStyleBlackShoes();

		} else if (name.equals("brownShoes")) {

			return new FRStyleBrownShoes();

		} else if (name.equals("redShoes")) {

			return new FRStyleRedShoes();

		} else if (name.equals("blueShoes")) {

			return new BlueShoes();

		}else {

			return null;
		}
	}

}
