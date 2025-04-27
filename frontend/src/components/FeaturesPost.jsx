import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import BookingFilter from "../components/BookingFilter";
import { Helmet } from "react-helmet";
import Loader from "../components/Loader";

const FeaturesPost = ({}) => {
  const [showCourseData, setDataCourse] = useState([]);
  const [showCountryData, setCountryData] = useState([]);
  const [showOfferingData, setOfferingData] = useState([]);
  const [loading, setLoading] = useState(false);

  const fetechCourseData = async () => {
    setLoading(true);
    const post_category_id = 3;
    try {
      const response = await axios.get(`/public/getPostData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setDataCourse(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };

  const CountryData = async () => {
    setLoading(true);
    const post_category_id = 2;
    try {
      const response = await axios.get(`/public/getPostData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setCountryData(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };


  const offeringData = async () => {
    setLoading(true);
    const post_category_id = 6;
    try {
      const response = await axios.get(`/public/getPostData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setOfferingData(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };


  useEffect(() => {
    fetechCourseData();
    CountryData();
    offeringData();
  }, []);

  return (
    <div className="col-xl-3 col-lg-4 sidebar-widget-area sidebar-break-md">
      <div className="widget">
        <div className="section-heading heading-dark">
          <h3 className="item-heading">POPULAR COURSES</h3>
        </div>
        <div className="widget-latest">
          <ul className="block-list">
            {showCourseData.map((item) => (
              <li className="single-item" key={item.id}>
                <div className="item-img">
                  <Link to={`/details/${item.slug}`}>
                    <img
                      src={item.image}
                      alt={item.title}
                      className="img-fluid rounded w-100"
                      style={{
                        width: "50px", // fixed width
                        height: "50px", // fixed height
                        objectFit: "cover", // crop nicely without distortion
                        border: "4px solid #ccc",
                        borderRadius: "8px",
                        boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                      }}
                    />
                  </Link>
                </div>
                <div className="item-content">
                  <ul className="entry-meta meta-color-dark"></ul>
                  <h4 className="item-title">
                  <Link to={`/details/${item.slug}`}>
                      {item.title.length > 20
                        ? item.title.slice(0, 20) + "..."
                        : item.title}
                    </Link>
                  </h4>
                </div>
              </li>
            ))}
          </ul>
        </div>
      </div>

      <div className="widget">
        <div className="section-heading heading-dark">
          <h3 className="item-heading">POPULAR COUNTRIES</h3>
        </div>
        <div className="widget-latest">
          <ul className="block-list">
            {showCountryData.map((item) => (
              <li className="single-item" key={item.id}>
                <div className="item-img">
                <Link to={`/details/${item.slug}`}>
                    <img
                      src={item.image}
                      alt={item.title}
                      className="img-fluid rounded w-100"
                      style={{
                        width: "50px", // fixed width
                        height: "50px", // fixed height
                        objectFit: "cover", // crop nicely without distortion
                        border: "4px solid #ccc",
                        borderRadius: "8px",
                        boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
                      }}
                    />
                  </Link>
                </div>
                <div className="item-content">
                  <ul className="entry-meta meta-color-dark"></ul>
                  <h4 className="item-title">
                  <Link to={`/details/${item.slug}`}>
                      {item.title.length > 20
                        ? item.title.slice(0, 20) + "..."
                        : item.title}
                    </Link>
                  </h4>
                </div>
              </li>
            ))}
          </ul>
        </div>
      </div>


      <div className="widget">
        <div className="section-heading heading-dark">
          <h3 className="item-heading">OUR OIFFERING</h3>
        </div>
        <div className="widget-latest">
          <ul className="block-list">
            {showOfferingData.map((item) => (
              <li className="single-item" key={item.id}>
                <div className="item-content">
                  <ul className="entry-meta meta-color-dark"></ul>
                  <h4 className="item-title">
                  <Link to={`/details/${item.slug}`}>
                      {item.title.length > 20
                        ? item.title.slice(0, 20) + "..."
                        : item.title}
                    </Link>
                  </h4>
                </div>
              </li>
            ))}
          </ul>
        </div>
      </div>

      <div className="widget d-none">
        <div className="section-heading heading-dark">
          <h3 className="item-heading">CATEGORIES</h3>
        </div>
        <div className="widget-categories">
          <ul>
            <li>
              <a href="#">
                Beauty
                <span>(35)</span>
              </a>
            </li>
            <li>
              <a href="#">
                Fashion
                <span>(10)</span>
              </a>
            </li>
            <li>
              <a href="#">
                Food
                <span>(25)</span>
              </a>
            </li>
            <li>
              <a href="#">
                Life Style
                <span>(15)</span>
              </a>
            </li>
            <li>
              <a href="#">
                Travel
                <span>(22)</span>
              </a>
            </li>
            <li>
              <a href="#">
                Video
                <span>(18)</span>
              </a>
            </li>
            <li>
              <a href="#">
                Technology
                <span>(22)</span>
              </a>
            </li>
          </ul>
        </div>
      </div>

      <div className="widget d-none">
        <div className="section-heading heading-dark">
          <h3 className="item-heading">FEATURED ARTICLE</h3>
        </div>
        <div className="widget-featured-feed">
          <div
            className="rc-carousel dot-control-layout1"
            data-loop="true"
            data-items={3}
            data-margin={5}
            data-autoplay="false"
            data-autoplay-timeout={5000}
            data-smart-speed={1000}
            data-dots="true"
            data-nav="false"
            data-nav-speed="false"
            data-r-x-small={1}
            data-r-x-small-nav="false"
            data-r-x-small-dots="true"
            data-r-x-medium={1}
            data-r-x-medium-nav="false"
            data-r-x-medium-dots="true"
            data-r-small={1}
            data-r-small-nav="false"
            data-r-small-dots="true"
            data-r-medium={1}
            data-r-medium-nav="false"
            data-r-medium-dots="true"
            data-r-large={1}
            data-r-large-nav="false"
            data-r-large-dots="true"
            data-r-extra-large={1}
            data-r-extra-large-nav="false"
            data-r-extra-large-dots="true"
          >
            <div className="featured-box-layout1">
              <div className="item-img">
                <img
                  src="/img/blog/blog16.jpg"
                  alt="Brand"
                  className="img-fluid"
                />
              </div>
              <div className="item-content">
                <h5 className="item-title">
                  <a href="single-blog.html">
                    Dreamy Places will Never Get to Visit
                  </a>
                </h5>
              </div>
            </div>
            <div className="featured-box-layout1">
              <div className="item-img">
                <img
                  src="/img/blog/blog17.jpg"
                  alt="Brand"
                  className="img-fluid"
                />
              </div>
              <div className="item-content">
                <h5 className="item-title">
                  <a href="single-blog.html">
                    Dreamy Places will Never Get to Visit
                  </a>
                </h5>
              </div>
            </div>
            <div className="featured-box-layout1">
              <div className="item-img">
                <img
                  src="/img/blog/blog16.jpg"
                  alt="Brand"
                  className="img-fluid"
                />
              </div>
              <div className="item-content">
                <h5 className="item-title">
                  <a href="single-blog.html">
                    Dreamy Places will Never Get to Visit
                  </a>
                </h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default FeaturesPost;
