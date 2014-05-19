using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Text;

using Rock.DataContract;

namespace Rock.Service
{
    public class MenuService
    {

        public static List<MenuContract> GetAllMenu()
        {
            List<MenuContract> list = new List<MenuContract>();

            XDocument menuXML = XDocument.Load(AppDomain.CurrentDomain.BaseDirectory+"/App_Data/MenuData.xml");

            var menus = menuXML.Root.Elements();

            foreach (XElement item in menus)
            {
                MenuContract menu = new MenuContract
                {
                    IsSubMenu = false,
                    Link = item.Attribute("link") == null ? string.Empty : item.Attribute("link").Value,
                    Title = item.Attribute("title").Value,
                    SubMenus = new List<MenuContract>()
                };

                var subMenus = item.Elements();
                foreach (XElement subMenu in subMenus)
                {
                    MenuContract _subMenu = new MenuContract
                    {
                        IsSubMenu = false,
                        Link = item.Attribute("link").Value,
                        Title = item.Attribute("title").Value
                    };

                    menu.SubMenus.Add(_subMenu);
                }

                list.Add(menu);
            }

            return list;
        }

    }
}
