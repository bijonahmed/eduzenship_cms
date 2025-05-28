import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import { Helmet } from "react-helmet";
import Loader from "../components/Loader";
const Goals = () => {
  const [showData, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const fetechData = async () => {
    setLoading(true);
    const post_category_id = 9;
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
          <title>Goals</title>
        </Helmet>
        <section className="inner-page-banner bg-common">
          <div className="container">
            <div className="row">
              <div className="col-12">
                <div className="breadcrumbs-area">
                  <h1>Goals</h1>
                  <ul>
                    <li>
                      <Link to="/">Home</Link>
                    </li>
                    <li>Goals</li>
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
                    <div className="blog-box-layout1" key={item.id}>
                      <div className="item_img">
                        <img
                          src={item.image}
                          alt={item.name}
                          className="img-fluid rounded w-100"
                          style={{
                            height: "auto",
                            maxHeight: "600px",
                            border: "4px solid #ccc", // light gray border
                            borderRadius: "8px", // slightly rounded corners
                            boxShadow: "0 4px 12px rgba(0,0,0,0.1)", // subtle shadow for depth
                          }}
                        />
                      </div>
                      <div
                        className="item-content"
                        style={{ maxWidth: "100%", color: "black" }}
                      >
                        <h1
                          className="item-title h4 mb-3"
                          style={{ fontSize: "25px" }}
                        >
                          {item.name}
                        </h1>
                        <div style={{ color: "black" }}>
                          <div
                            className="text-justify"
                            style={{ color: "inherit" }}
                            dangerouslySetInnerHTML={{
                              __html: item.description,
                            }}
                          ></div>
                        </div>
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

export default Goals;
