package shoes.factory_02.factory;

import shoes.factory_02.shoes.BlackShoes;
import shoes.factory_02.shoes.BrownShoes;
import shoes.factory_02.shoes.RedShoes;
import shoes.factory_02.shoes.Shoes;

public class ShoesFactory {
	public Shoes makingShoes(String name) {
		Shoes shoes = null;
		if (name.equals("blackShoes")) {

			shoes = new BlackShoes();

		} else if (name.equals("brownShoes")) {

			shoes = new BrownShoes();

		} else if (name.equals("redShoes")) {

			shoes = new RedShoes();
		}

		return shoes;
	}
}
