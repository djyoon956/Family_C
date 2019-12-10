package shoes.factory_01;

import shoes.factory_01.shoes.Shoes;
import shoes.factory_01.store.ShoesStore;

public class program {
	public static void main(String[] args) {
		ShoesStore store = new ShoesStore();
		Shoes shoes = store.orderShoes("blackShoes");

		System.out.println("주문 구두 정보");
		System.out.println(shoes.toString());
	}
}
