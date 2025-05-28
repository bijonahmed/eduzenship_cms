// src/Navbar.js
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import AuthUser from "../components/AuthUser";
import Footer from "../components/Footer";
import axios from "/config/axiosConfig";
import "../components/css/navbar.css";
import $ from "jquery";

const Navbar = () => {
  const navigate = useNavigate();
  const [name, setName] = useState("");
  const { getToken, token, logout } = AuthUser();
  const [isSidebarOpen, setSidebarOpen] = useState(false);
  const fetechGlobalData = async () => {
    try {
      const response = await axios.get(`/public/getGlobalData`);
      // console.log("Navbar API Response:", response.data); // Log the response
      setName(response.data);
    } catch (error) {
      console.error("Error fetching data", error);
    }
  };

  const logoutUser = async () => {
    if (token) {
      await logout();
      navigate("/login");
    }
  };

  useEffect(() => {
    fetechGlobalData();

    const menu = document.getElementById("header-menu");
    const placeholder = document.getElementById("rt-sticky-placeholder");

    const handleScroll = () => {
      if (!menu || !placeholder) return;

      const offsetTop = placeholder.offsetTop;

      if (window.scrollY >= offsetTop) {
        menu.classList.add("sticky-header-menu");
        placeholder.style.height = `${menu.offsetHeight}px`; // Prevent jump
      } else {
        menu.classList.remove("sticky-header-menu");
        placeholder.style.height = "0px";
      }
    };

    window.addEventListener("scroll", handleScroll);
    return () => window.removeEventListener("scroll", handleScroll);
  }, []);

const [isMenuOpen, setIsMenuOpen] = useState(false);

  // Toggle function to control the collapse
  const toggleCollapse = () => {
    setIsCollapsed(!isCollapsed);
  };

  return (
    <>
      {/* header  */}
      <header className="has-mobile-menu">
        <div
          id="header-topbar"
          className="pt--14 pb--14 bg--light border-bootom border-color-accent1"
        >
          <div className="container">
            <div className="row d-flex align-items-center">
              <div className="col-lg-3 d-flex justify-content-start">
                <div className="header-action-items">
                  <ul>
                    <li className="item-subscribe">
                      <i className="flaticon-envelope" />
                      SUBSCRIBE!
                    </li>
                  </ul>
                </div>
              </div>
              <div className="col-lg-9 d-flex justify-content-end">
                <div className="header-action-items">
                  <ul>
                    <li className="item-social-layout1">
                      <i className="fab fa-facebook-f" />
                      10K <span>LIKES</span>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div id="header-middlebar" className="sticky-top box-layout-child bg--light border-bootom border-color-accent2">
          <div className="pt--25 pb--25">
            <div className="container">
              <div className="row d-flex align-items-center">
                <div className="col-lg-4">
                  <div className="header-action-items">
                    <ul>
                      <li className="offcanvas-menu-trigger-wrap">
                        <button
                          type="button"
                          onClick={() => setIsMenuOpen(prev => !prev)}
                          className="offcanvas-menu-btn menu-status-open"
                        >
                          <span className="btn-icon-wrap">
                            <span />
                            <span />
                            <span />
                          </span>
                        </button>
                      </li>
                    </ul>
                  </div>
                </div>
                <div className="col-lg-4 d-flex justify-content-center">
                  <div className="logo-area">
                    <Link to="/" className="temp-logo" id="temp-logo">
                      <img
                        src="/img/main-logo.png"
                        alt="logo"
                        className="img-fluid"
                        style={{ height: "60px" }}
                      />
                    </Link>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="rt-sticky-placeholder" />
        <div  id="header-menu" className="header-menu menu-layout1 box-layout-child bg--light" >
          <div className="container">
            <div className="row">
              <div className="col-lg-12">
                <nav id="dropdown" className="template-main-menu">
                  <ul>
                    <li className="hide-on-mobile-menu">
                      <a href="/">HOME</a>
                    </li>
                    <li className="hide-on-desktop-menu">
                      <a href="/">HOME</a>
                    </li>
                    <li>
                      <Link to="/about">ABOUT</Link>
                    </li>
                    <li>
                      <a href="#">CATEGORIES</a>
                      <ul className="dropdown-menu-col-1">
                        <li>
                          <a href="#">Blog Category 1</a>
                        </li>
                        <li>
                          <a href="#">Blog Category 2</a>
                        </li>
                        <li>
                          <a href="#">Blog Category 3</a>
                        </li>
                        <li>
                          <a href="#">Blog Category 4</a>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <a href="#">BLOG</a>
                    </li>
                    <li>
                      <Link to="/contact">CONTACT</Link>
                    </li>
                  </ul>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </header>

      <div   className={`offcanvas-menu-wrap ${isMenuOpen ? "active" : ""}`} id="offcanvas-wrap" data-position="left" >
        <div className="offcanvas-content">
          <div className="offcanvas-logo">
            <a href="/">
              <img src="/img/main-logo.png" style={{ height: '50px', width: '100%'}} alt="logo" />
            </a>
          </div>
          <ul className="offcanvas-menu">
            <li className="nav-item">
              <a href="/">HOME</a>
            </li>
            <li className="nav-item">
              <Link href="/about">ABOUT</Link>
            </li>
            <li className="nav-item">
              <a href="#">CATEGORIES</a>
            </li>
            <li className="nav-item">
              <a href="#">Blog</a>
            </li>
             <li className="nav-item">
              <Link href="/contact">Contact</Link>
            </li>
          </ul>
          <div className="offcanvas-footer">
            <div className="item-title">Follow Me</div>
            <ul className="offcanvas-social">
              <li>
                <a href="#">
                  <i className="fab fa-facebook-f" />
                </a>
              </li>
              
            </ul>
          </div>
        </div>
      </div>
    </>
  );
};

export default Navbar;
