import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import BookingFilter from "../components/BookingFilter";
import { Helmet } from "react-helmet";
import Loader from "../components/Loader";

const OurOffer = () => {
  const [showData, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const fetechData = async () => {
    setLoading(true);
    const post_category_id = 6;
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
          <title>Our Offering</title>
        </Helmet>
        <section className="inner-page-banner bg-common">
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="breadcrumbs-area">
                  <h1>Our Offering</h1>
                  <ul>
                    <li>
                      <Link to="/">Home</Link>
                    </li>
                    <li>Our Offering</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </section>
        <br />
        <section className="blog-wrap-layout2">
          <div className="container">
            <div className="row gutters-40">
              {/* Blog Item */}

              <div
                className="col-xl-12 col-lg-12 h-100"
                style={{ minHeight: "600px" }}
              >
                {loading ? (
                  // Show a loader while loading
                  <center>
                    <Loader />
                  </center>
                ) : (
                  // Show content once loading is finished
                  showData.map((item) => (
                    <div
                      className="blog-box-layout1"
                      key={item.id}
                      style={{
                        border: "1px solid #e0e0e0",
                        borderRadius: "12px",
                        padding: "20px",
                        marginBottom: "30px",
                        boxShadow: "0 2px 8px rgba(0,0,0,0.05)",
                        backgroundColor: "#fff",
                      }}
                    >
                      <div
                        className="item_img"
                        style={{ marginBottom: "15px" }}
                      >
                        {item.image && (
                          <img
                            src={item.image}
                            alt={item.name}
                            className="img-fluid rounded w-100"
                            style={{
                              height: "auto",
                              maxHeight: "400px",
                              borderRadius: "10px",
                              objectFit: "cover",
                              width: "100%",
                              boxShadow: "0 4px 10px rgba(0,0,0,0.08)",
                            }}
                          />
                        )}
                      </div>
                      <div
                        className="item-content"
                        style={{
                          maxWidth: "100%",
                          color: "#333",
                          lineHeight: "1.6",
                        }}
                      >
                        <h2
                          className="item-title mb-3"
                          style={{
                            fontSize: "22px",
                            fontWeight: "600",
                            color: "#222",
                            marginBottom: "10px",
                          }}
                        >
                          {item.title}
                        </h2>
                        <div
                          style={{ color: "#555", fontSize: "16px" }}
                          dangerouslySetInnerHTML={{ __html: item.description }}
                        ></div>
                      </div>
                    </div>
                  ))
                )}
              </div>

              {/* End of Blog Item */}
            </div>
          </div>
        </section>

        <Footer />
      </div>
    </div>
  );
};

export default OurOffer;
