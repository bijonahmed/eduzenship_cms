import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import Loader from "../components/Loader";
import { Helmet } from "react-helmet";
import "../components/css/about.css";

const About = () => {
  const [showData, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const fetechData = async () => {
    setLoading(true);
    const post_category_id = 1;
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

      <div id="wrapper" className="box-layout-child bg--light wrapper">
        <Header />

        <Helmet>
          <title>About</title>
        </Helmet>
        <section className="inner-page-banner bg-common">
          <div className="container-fluid">
            <div className="row">
              <div className="col-12">
                <div className="breadcrumbs-area">
                  <h1>About</h1>
                  <ul>
                    <li>
                      <Link to="/">Home</Link>
                    </li>
                    <li>About</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>
        <br />
        <section className="blog-section">
            <div className="row">
              <div className="col-12 content-wrapper">
                {loading ? (
                  <div className="loader-wrapper">
                    <Loader />
                  </div>
                ) : (
                  showData.map((item) => (
                    <div className="blog-card" key={item.id}>
                      <div className="blog-image">
                        <img src={item.image} alt={item.name} />
                      </div>
                      <div className="blog-content">
                        <h2 className="blog-title">{item.name}</h2>
                        <div
                          className="blog-description"
                          dangerouslySetInnerHTML={{ __html: item.description }}
                        ></div>
                      </div>
                    </div>
                  ))
                )}
              </div>
            </div>
         
        </section>
      </div>
      <br />
      <Footer />
    </div>
  );
};

export default About;
