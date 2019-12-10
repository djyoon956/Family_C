package shoes.factory_02;

import shoes.factory_02.shoes.Shoes;
import shoes.factory_02.store.ShoesStore;

public class program {
	public static void main(String[] args) {
		ShoesStore store = new ShoesStore();
		Shoes shoes = store.orderShoes("brownShoes");

		System.out.println("주문 구두 정보");
		System.out.println(shoes.toString());
	}
}
