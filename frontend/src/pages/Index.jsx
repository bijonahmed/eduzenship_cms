import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import Sliders from "../components/Sliders";
import FeaturesPost from "../components/FeaturesPost";
import Swal from "sweetalert2";
import { Helmet } from "react-helmet";
import "../components/css/navbar.css";

const Index = () => {
  const [showCourseData, setDataCourse] = useState([]);
  const [showCountryData, setCountryData] = useState([]);
  const [showOfferingData, setOfferingData] = useState([]);
  const [blogData, setBlogData] = useState([]);
  const [featuresData, setFeaturesData] = useState("");
  const [loading, setLoading] = useState(false);

  const fetechBlogData = async () => {
    setLoading(true);
    const post_category_id = 14;
    try {
      const response = await axios.get(`/public/getPostData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setBlogData(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };

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

  const featuresArticlePost = async () => {
    setLoading(true);
    const post_category_id = 8;
    try {
      const response = await axios.get(`/public/getFeaturesArticle`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setFeaturesData(response.data.data);
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
    featuresArticlePost();
    fetechBlogData();
  }, []);

  return (
    <div>
      <Helmet>
        <title>Welcome to eduzenship</title>
      </Helmet>

      <a href="#wrapper" data-type="section-switch" className="scrollup">
        <i className="fas fa-angle-double-up" />
      </a>
      <div id="wrapper" className="wrapper">
        <Header />
        <div className="box-layout-child bg-white">
          <Sliders />
          <section className="blog-wrap-layout2 mt-3">
            <div className="container">
              <section
                className="blog-wrap-layout1"
                style={{ marginTop: "40px", padding: "10px 0" }}
              >
                <div className="container">
                  {/* Section Title */}
                  <div className="text-center mb-5">
                    <h2
                      style={{
                        fontSize: "34px",
                        fontWeight: "700",
                        color: "#222",
                      }}
                    >
                      Popular Courses
                    </h2>
                    <p style={{ fontSize: "18px", color: "#666" }}>
                      Explore our top trending courses selected just for you.
                    </p>
                  </div>

                  {/* Courses */}
                  <div className="row g-4">
                    {showCourseData.slice(0, 3).map((item, index) => (
                      <div className="col-lg-4" key={index}>
                        <div
                          className="blog-box-layout1"
                          style={{
                            background: "#fff",
                            borderRadius: "12px",
                            boxShadow: "0px 8px 24px rgba(0, 0, 0, 0.08)",
                            overflow: "hidden",
                            transition: "transform 0.3s ease",
                            height: "100%",
                            display: "flex",
                            flexDirection: "column",
                          }}
                        >
                          <div className="item-img">
                            <Link to={`/details/${item.slug}`}>
                              <img
                                src={item.image}
                                alt={item.title}
                                style={{
                                  width: "100%",
                                  height: "230px",
                                  objectFit: "cover",
                                }}
                              />
                            </Link>
                          </div>
                          <div
                            className="item-content p-4"
                            style={{ flexGrow: 1 }}
                          >
                            <h3
                              className="item-title"
                              style={{
                                fontSize: "20px",
                                fontWeight: "600",
                                lineHeight: "1.4",
                                marginBottom: "10px",
                              }}
                            >
                              <Link
                                to={`/details/${item.slug}`}
                                style={{
                                  color: "#222",
                                  textDecoration: "none",
                                }}
                              >
                                {item.title.length > 55
                                  ? item.title.slice(0, 55) + "..."
                                  : item.title}
                              </Link>
                            </h3>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                  {/* View All Courses Button */}
                  <div className="text-center mt-5">
                    <Link
                      to="/courses"
                      className="btn"
                      style={{
                        padding: "14px 35px",
                        backgroundColor: "#4CAF50",
                        color: "#fff",
                        borderRadius: "8px",
                        fontSize: "18px",
                        fontWeight: "600",
                        textDecoration: "none",
                        boxShadow: "0px 6px 15px rgba(76, 175, 80, 0.4)",
                        transition: "all 0.3s ease",
                      }}
                      onMouseOver={(e) => {
                        e.target.style.backgroundColor = "#43A047";
                        e.target.style.transform = "scale(1.05)";
                      }}
                      onMouseOut={(e) => {
                        e.target.style.backgroundColor = "#4CAF50";
                        e.target.style.transform = "scale(1)";
                      }}
                    >
                      View All Courses
                    </Link>
                  </div>
                </div>
              </section>

              {/* Blog Section */}
              <div className="row gutters-40 mt-5">
                <div className="col-xl-9 col-lg-8">
                  {/* Features Article Post */}

                  <div className="blog-box-layout1 mb-4">
                    <div className="item-img">
                      <img
                        src={featuresData.image}
                        alt={featuresData.title}
                        className="img-fluid rounded w-100"
                        style={{
                          height: "auto",
                          maxHeight: "400px",
                          border: "4px solid #ccc", // light gray border
                          borderRadius: "8px", // slightly rounded corners
                          boxShadow: "0 4px 12px rgba(0,0,0,0.1)", // subtle shadow for depth
                        }}
                      />
                    </div>
                    <div className="item-content mt-3">
                      <h2 className="item-title">
                      
                          {featuresData.title}
                       
                      </h2>
                      <p
                        style={{ color: "#666" }}
                        className="text-justify"
                        dangerouslySetInnerHTML={{
                          __html: featuresData.description,
                        }}
                      ></p>
                    </div>
                  </div>
                  {/* Show All Country  */}

                  {/* Section Title */}
                  <div className="text-center mb-5">
                    <h2
                      style={{
                        fontSize: "34px",
                        fontWeight: "700",
                        color: "#222",
                      }}
                    >
                      Popular Countries
                    </h2>
                    <p style={{ fontSize: "18px", color: "#666" }}>
                      Discover the top destinations that students and travelers
                      love the most.
                    </p>
                  </div>

                  {/* Courses */}
                  <div className="row g-4">
                    {showCountryData.map((item, index) => (
                      <div className="col-lg-4" key={index}>
                        <div
                          className="blog-box-layout1"
                          style={{
                            background: "#fff",
                            borderRadius: "12px",
                            boxShadow: "0px 8px 24px rgba(0, 0, 0, 0.08)",
                            overflow: "hidden",
                            transition: "transform 0.3s ease",
                            height: "100%",
                            display: "flex",
                            flexDirection: "column",
                          }}
                        >
                          <div className="item-img">
                            <Link to={`/details/${item.slug}`}>
                              <img
                                src={item.image}
                                alt={item.title}
                                style={{
                                  width: "100%",
                                  height: "230px",
                                  objectFit: "cover",
                                }}
                              />
                            </Link>
                          </div>
                          <div
                            className="item-content p-4"
                            style={{ flexGrow: 1 }}
                          >
                            <h3
                              className="item-title"
                              style={{
                                fontSize: "20px",
                                fontWeight: "600",
                                lineHeight: "1.4",
                                marginBottom: "10px",
                              }}
                            >
                              
                                {item.title.length > 55
                                  ? item.title.slice(0, 55) + "..."
                                  : item.title}
                              
                            </h3>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>

                  {/* Two Column Blog */}
                  <div className="row gutters-40 mt-5">
                  {blogData.slice(-4).map((item) => (
                      <div className="col-sm-6 col-12">
                        <div className="blog-box-layout1 mb-4">
                          <div className="item-img">
                            <Link
                              to={`/reading-blog/${item.slug}`}
                              className="item-btn"
                            >
                              <img
                                src={item.image}
                                alt={item.title}
                                className="img-fluid rounded w-100"
                                style={{
                                  height: "auto",
                                  maxHeight: "400px",
                                  border: "4px solid #ccc", // light gray border
                                  borderRadius: "8px", // slightly rounded corners
                                  boxShadow: "0 4px 12px rgba(0,0,0,0.1)", // subtle shadow for depth
                                }}
                              />
                            </Link>
                          </div>
                          <div className="item-content mt-3">
                            <h3 className="item-title">
                              <Link
                                to={`/reading-blog/${item.slug}`}
                                style={{
                                  color: "#222",
                                  textDecoration: "none",
                                }}
                              >
                                 {item.title.length > 20 ? item.title.slice(0, 20) + "..." : item.title}
                              </Link>
                            </h3>
                            <p
                              className="text-justify"
                              style={{ color: "inherit" }}
                              dangerouslySetInnerHTML={{
                                __html:
                                  item.description.length > 300
                                    ? item.description.slice(0, 300) + "..."
                                    : item.description,
                              }}
                            ></p>
                            <Link
                              to={`/reading-blog/${item.slug}`}
                              className="item-btn"
                            >
                              READ MORE{" "}
                              <i className="fas fa-arrow-right ml-2" />
                            </Link>
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>

                {/* Features Post Component */}
                <FeaturesPost />
              </div>
            </div>
          </section>
          {/* Blog Area End */}
        </div>

        {/* Footer Area Start Here */}
        <Footer />
        {/* Footer Area End Here */}
        {/* Search Box Start Here */}

        {/* Search Box End Here */}
      </div>
    </div>
  );
};

export default Index;
