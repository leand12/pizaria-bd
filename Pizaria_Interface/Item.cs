﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pizaria
{
	public class Item
	{
		private int _ID;
		private string _name;
		private double _price;

		public int ID {
			get { return _ID; }
			set { _ID = value;  }
		}

		public string name
		{
			get { return _name; }
			set { _name = value; }
		}

		public double price
		{
			get { return _price; }
			set { _price = value; }
		}


		public Item(int ID, string name, double price) {
			this.ID = ID;
			this.name = name;
			this.price = price;
		}

		public Item()
		{

		}

		public override string ToString() {
			//return String.Format("%20s %f€", name, price);
			return _name + "  " + _price;
		}
	}
}