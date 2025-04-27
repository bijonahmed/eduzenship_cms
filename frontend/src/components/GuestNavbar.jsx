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

  const [isCollapsed, setIsCollapsed] = useState(true);

  // Toggle function to control the collapse
  const toggleCollapse = () => {
    setIsCollapsed(!isCollapsed);
  };

  return (
    <>
      {/* header  */}
      {/* Mobile Navbar: Visible only on screens < 992px */}
      <nav className="navbar navbar-light bg-light d-block d-lg-none">
        <div className="container d-flex justify-content-between align-items-center">
          {/* Logo (Left) */}
          <Link className="navbar-brand" to="/">
            <img
              src="/img/main-logo.png"
              width={120}
              alt="Logo"
            />
          </Link>
          {/* Toggler (Right) */}
          <button
            className="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#mobileNavbar"
            aria-controls="mobileNavbar"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span className="navbar-toggler-icon" />
          </button>
        </div>
        {/* Collapsible Menu */}
        <div className="collapse navbar-collapse" id="mobileNavbar">
          <ul className="navbar-nav px-3">
            <li className="nav-item">
              <Link className="nav-link" to="/">
                Home
              </Link>
            </li>
            <li className="nav-item">
              <Link className="nav-link" to="/about">
                About
              </Link>
            </li>
            <li className="nav-item">
              <a className="nav-link" href="#">
                Blog
              </a>
            </li>
            <li className="nav-item">
              <Link className="nav-link" to="/contact">
                Contact
              </Link>
            </li>
          </ul>
        </div>
      </nav>

      <header className="has-mobile-menu">
        <div
          id="header-middlebar"
          className="box-layout-child bg--light border-bootom border-color-accent2"
        ></div>
        <div id="rt-sticky-placeholder" />
        <div
          id="header-menu"
          className="header-menu menu-layout1 box-layout-child bg--light"
        >
          <div className="container">
            <div className="row">
              <div className="col-lg-12">
                <nav id="dropdown" className="template-main-menu">
                  <ul>
                    <div className="logo-area">
                      <Link to="/" className="temp-logo" id="temp-logo">
                        <img
                          src="/img/main-logo.png"
                          alt="logo"
                          className="img-fluid"
                          style={{
                            width: "150px",
                            height: "auto",
                            marginTop: "20px",
                          }} // Set width and height
                        />
                      </Link>
                    </div>
                    <li className="hide-on-mobile-menu">
                      <Link to="/">HOME</Link>
                    </li>

                    <li>
                      <Link to="/about">
                        ABOUT
                        <i className="fas fa-chevron-down" style={{ marginLeft: "8px" }}/>
                      </Link>
                      <ul className="dropdown-menu-col-1">
                        <li><Link to="/about">About US</Link></li>
                        <li><Link to="/mission-vision">Mission & Vision</Link></li>
                        <li><Link to="/goals">Goals</Link></li>
                      </ul>
                    </li>

                    <li>
                      <a href="#"> Service <i className="fas fa-chevron-down" style={{ marginLeft: "8px" }}/>
                      </a>
                      <ul className="dropdown-menu-col-1">
                        <li>
                          <Link to="/countries">Countries</Link>
                        </li>
                        <li>
                          <Link to="/courses">Course</Link>
                        </li>
                        <li>
                          <Link to="/our-services">Our Services</Link>
                        </li>
                        <li>
                          <Link to="/our-offerings">Our Offerings</Link>
                        </li>
                      </ul>
                    </li>
                    <li>
                      <Link to="/blog">BLOG</Link>
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

      {/* ------------- Header end ----------------  */}
    </>
  );
};

export default Navbar;
