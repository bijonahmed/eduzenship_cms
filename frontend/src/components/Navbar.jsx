import React, { useState, useEffect, useContext } from "react"; // Ensure useContext is imported
import { useNavigate, Link, useParams } from "react-router-dom"; // Combine imports from react-router-dom
import axios from "/config/axiosConfig"; // Assuming your axios config is correct
import AuthUser from "../components/AuthUser";

const Navbar = () => {
  return (
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
                    259k <span>LIKES</span>
                  </li>
                  <li className="item-social-layout1">
                    <i className="fab fa-twitter" />
                    480k <span>FOLLOWERS</span>
                  </li>
                  <li className="item-social-layout1">
                    <i className="fab fa-instagram" />
                    280k <span>FOLLOWERS</span>
                  </li>
                  <li className="item-social-layout1">
                    <i className="fab fa-youtube" />
                    180k <span>SUBSCRIBER</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div
        id="header-middlebar"
        className="box-layout-child bg--light border-bootom border-color-accent2"
      >
        <div className="pt--25 pb--25">
          <div className="container">
            <div className="row d-flex align-items-center">
              <div className="col-lg-4">
                <div className="header-action-items">
                  <ul>
                    <li className="offcanvas-menu-trigger-wrap">
                      <button
                        type="button"
                        className="offcanvas-menu-btn menu-status-open"
                      >
                        <span className="btn-icon-wrap">
                          <span />
                          <span />
                          <span />
                        </span>
                      </button>
                    </li>
                    <li className="user-icon">
                      <a href="#">
                        <i className="flaticon-profile" />
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div className="col-lg-4 d-flex justify-content-center">
                <div className="logo-area">
                  <a href="index.html" className="temp-logo" id="temp-logo">
                    <img
                      src="img/logo-dark.png"
                      alt="logo"
                      className="img-fluid"
                    />
                  </a>
                </div>
              </div>
              <div className="col-lg-4 d-flex justify-content-end">
                <div className="header-action-items">
                  <ul>
                    <li className="header-search-box divider-style-border">
                      <a href="#header-search" title="Search">
                        <i className="flaticon-magnifying-glass" />
                      </a>
                    </li>
                    <li className="cart-wrap divider-style-border">
                      <div className="cart-info">
                        <i className="flaticon-shopping-bag" />
                        <div className="cart-amount">0</div>
                      </div>
                      <div className="cart-items">
                        <div className="cart-item">
                          <div className="cart-img">
                            <a href="#">
                              <img
                                src="img/product/top-product1.jpg"
                                alt="product"
                                className="img-fluid"
                              />
                            </a>
                          </div>
                          <div className="cart-title">
                            <a href="#">Pressure</a>
                            <span>Code: STPT601</span>
                          </div>
                          <div className="cart-quantity">X 1</div>
                          <div className="cart-price">$249</div>
                          <div className="cart-trash">
                            <a href="#">
                              <i className="far fa-trash-alt" />
                            </a>
                          </div>
                        </div>
                        <div className="cart-item">
                          <div className="cart-img">
                            <a href="#">
                              <img
                                src="img/product/top-product2.jpg"
                                alt="product"
                                className="img-fluid"
                              />
                            </a>
                          </div>
                          <div className="cart-title">
                            <a href="#">Stethoscope</a>
                            <span>Code: STPT602</span>
                          </div>
                          <div className="cart-quantity">X 1</div>
                          <div className="cart-price">$189</div>
                          <div className="cart-trash">
                            <a href="#">
                              <i className="far fa-trash-alt" />
                            </a>
                          </div>
                        </div>
                        <div className="cart-item">
                          <div className="cart-img">
                            <a href="#">
                              <img
                                src="img/product/top-product3.jpg"
                                alt="product"
                                className="img-fluid"
                              />
                            </a>
                          </div>
                          <div className="cart-title">
                            <a href="#">Microscope</a>
                            <span>Code: STPT603</span>
                          </div>
                          <div className="cart-quantity">X 2</div>
                          <div className="cart-price">$379</div>
                          <div className="cart-trash">
                            <a href="#">
                              <i className="far fa-trash-alt" />
                            </a>
                          </div>
                        </div>
                        <div className="cart-item">
                          <div className="cart-btn">
                            <a href="#" className="item-btn">
                              View Cart
                            </a>
                            <a href="#" className="item-btn">
                              Checkout
                            </a>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
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
                  <li className="hide-on-mobile-menu">
                    <a href="#">HOME</a>
                    <ul className="dropdown-menu-col-2">
                      <li>
                        <a href="index.html">Home 1</a>
                        <a href="index2.html">Home 2</a>
                        <a href="index3.html">Home 3</a>
                        <a href="index4.html">Home 4</a>
                        <a href="index5.html">Home 5</a>
                        <a href="index6.html">Home 6</a>
                        <a href="index7.html">Home 7</a>
                      </li>
                      <li>
                        <a href="index8.html">Home 8</a>
                        <a href="index9.html">Home 9</a>
                        <a href="index10.html">Home 10</a>
                        <a href="index11.html">Home 11</a>
                        <a href="index12.html">Home 12</a>
                        <a href="index13.html">Home 13</a>
                        <a href="coming-soon.html">Coming Soon</a>
                      </li>
                    </ul>
                  </li>
                  <li className="hide-on-desktop-menu">
                    <a href="#">HOME</a>
                    <ul className="dropdown-menu-col-2">
                      <li>
                        <a href="index.html">Home 1</a>
                      </li>
                      <li>
                        <a href="index2.html">Home 2</a>
                      </li>
                      <li>
                        <a href="index3.html">Home 3</a>
                      </li>
                      <li>
                        <a href="index4.html">Home 4</a>
                      </li>
                      <li>
                        <a href="index5.html">Home 5</a>
                      </li>
                      <li>
                        <a href="index6.html">Home 6</a>
                      </li>
                      <li>
                        <a href="index7.html">Home 7</a>
                      </li>
                      <li>
                        <a href="index8.html">Home 8</a>
                      </li>
                      <li>
                        <a href="index9.html">Home 9</a>
                      </li>
                      <li>
                        <a href="index10.html">Home 10</a>
                      </li>
                      <li>
                        <a href="index11.html">Home 11</a>
                      </li>
                      <li>
                        <a href="index12.html">Home 12</a>
                      </li>
                      <li>
                        <a href="index13.html">Home 13</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a href="about.html">ABOUT</a>
                  </li>
                  <li>
                    <a href="#">CATEGORIES</a>
                    <ul className="dropdown-menu-col-1">
                      <li>
                        <a href="blog-category1.html">Blog Category 1</a>
                      </li>
                      <li>
                        <a href="blog-category2.html">Blog Category 2</a>
                      </li>
                      <li>
                        <a href="blog-category3.html">Blog Category 3</a>
                      </li>
                      <li>
                        <a href="blog-category4.html">Blog Category 4</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a href="#">BLOG</a>
                    <ul className="dropdown-menu-col-1">
                      <li>
                        <a href="single-blog.html">Blog Details 1</a>
                      </li>
                      <li>
                        <a href="single-blog2.html">Blog Details 2</a>
                      </li>
                      <li>
                        <a href="single-blog3.html">Blog Details 3</a>
                      </li>
                    </ul>
                  </li>
                  <li className="possition-static hide-on-mobile-menu">
                    <a href="#">PAGES</a>
                    <div className="template-mega-menu">
                      <div className="container">
                        <div className="row">
                          <div className="col-3">
                            <div className="menu-ctg-title">Home</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="index.html">
                                  <i className="fas fa-home" />
                                  Home 1
                                </a>
                              </li>
                              <li>
                                <a href="index2.html">
                                  <i className="fas fa-home" />
                                  Home 2
                                </a>
                              </li>
                              <li>
                                <a href="index3.html">
                                  <i className="fas fa-home" />
                                  Home 3
                                </a>
                              </li>
                              <li>
                                <a href="index4.html">
                                  <i className="fas fa-home" />
                                  Home 4
                                </a>
                              </li>
                              <li>
                                <a href="index5.html">
                                  <i className="fas fa-home" />
                                  Home 5
                                </a>
                              </li>
                            </ul>
                          </div>
                          <div className="col-3">
                            <div className="menu-ctg-title">Home</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="index6.html">
                                  <i className="fas fa-home" />
                                  Home 6
                                </a>
                              </li>
                              <li>
                                <a href="index7.html">
                                  <i className="fas fa-home" />
                                  Home 7
                                </a>
                              </li>
                              <li>
                                <a href="index8.html">
                                  <i className="fas fa-home" />
                                  Home 8
                                </a>
                              </li>
                              <li>
                                <a href="index9.html">
                                  <i className="fas fa-home" />
                                  Home 9
                                </a>
                              </li>
                              <li>
                                <a href="index10.html">
                                  <i className="fas fa-home" />
                                  Home 10
                                </a>
                              </li>
                            </ul>
                          </div>
                          <div className="col-3">
                            <div className="menu-ctg-title">Home</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="index11.html">
                                  <i className="fas fa-home" />
                                  Home 11
                                </a>
                              </li>
                              <li>
                                <a href="index12.html">
                                  <i className="fas fa-home" />
                                  Home 12
                                </a>
                              </li>
                              <li>
                                <a href="index13.html">
                                  <i className="fas fa-home" />
                                  Home 13
                                </a>
                              </li>
                            </ul>
                            <div className="menu-ctg-title">ARCHIVES</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="archives1.html">
                                  <i className="fab fa-cloudversify" />
                                  Archive 1
                                </a>
                              </li>
                            </ul>
                          </div>
                          <div className="col-3">
                            <div className="menu-ctg-title">ARCHIVES</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="archives2.html">
                                  <i className="fab fa-cloudversify" />
                                  Archive 2
                                </a>
                              </li>
                            </ul>
                            <div className="menu-ctg-title">AUTHORS</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="authors.html">
                                  <i className="fas fa-users" />
                                  Authors
                                </a>
                              </li>
                            </ul>
                            <div className="menu-ctg-title">PAGES</div>
                            <ul className="sub-menu">
                              <li>
                                <a href="404.html">
                                  <i className="fas fa-user-secret" />
                                  404 Error
                                </a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>
                  </li>
                  <li className="hide-on-desktop-menu">
                    <a href="#">Pages</a>
                    <ul>
                      <li>
                        <a href="about.html">About 1</a>
                      </li>
                      <li>
                        <a href="blog-category1.html">Blog Category 1</a>
                      </li>
                      <li>
                        <a href="single-blog.html">Blog Details 1</a>
                      </li>
                      <li>
                        <a href="archives1.html">Archives 1</a>
                      </li>
                      <li>
                        <a href="404.html">404 Error</a>
                      </li>
                      <li>
                        <a href="contact.html">Contact</a>
                      </li>
                    </ul>
                  </li>
                  <li>
                    <a href="contact.html">CONTACT</a>
                  </li>
                </ul>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </header>
  );
};

export default Navbar;
