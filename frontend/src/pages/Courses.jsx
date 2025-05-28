import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import { Helmet } from "react-helmet";
import Loader from "../components/Loader";

const Courses = () => {
  const [showData, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const fetechData = async () => {
    setLoading(true);
    const post_category_id = 3;
    try {
      const response = await axios.get(`/public/getPostData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setData(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };
  useEffect(() => {
    fetechData();
  }, []);

  return (
    <div>
      {/* Scroll Up Button */}
      <a href="#wrapper" data-type="section-switch" className="scrollup">
        <i className="fas fa-angle-double-up" />
      </a>

      <div id="wrapper" className="wrapper">
        <Header />

        <Helmet>
          <title>Courses</title>
        </Helmet>

        <div>
          <section className="inner-page-banner bg-common">
            <div className="container">
              <div className="row">
                <div className="col-12">
                  <div className="breadcrumbs-area">
                    <h1>Courses</h1>
                    <ul>
                      <li>
                        <Link to="/">Home</Link>
                      </li>
                      <li>Courses</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </section>
          {/* Inne Page Banner Area End Here */}
          {/* Blog Area Start Here */}
          <section className="blog-wrap-layout23">
            <div className="container">
              <div className="row gutters-50">
                <div className="col-lg-8">
                  {loading ? (
                    // Show a loader while loading
                    <center>
                      <Loader />
                    </center>
                  ) : (
                    // Show content once loading is finished
                    showData.map((item) => (
                      <div
                        className="blog-box-layout3"
                        style={{ minHeight: "600px" }}
                        key={item.id}
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

                        <div className="item-content">
                          <h2 className="item-title mt-3">
                            <a href="#">{item.title}</a>
                          </h2>

                          <p
                            className="text-justify"
                            style={{ color: "inherit" }}
                            dangerouslySetInnerHTML={{
                              __html: item.description,
                            }}
                          ></p>
                        </div>
                      </div>
                    ))
                  )}
                </div>
             
              </div>
            </div>
          </section>
        </div>

        <Footer />
      </div>
    </div>
  );
};

export default Courses;
