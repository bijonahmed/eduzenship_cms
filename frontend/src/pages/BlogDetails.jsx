import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import CategorySlug from "../components/CategorySlug";
import { Helmet } from "react-helmet";
// import FeaturesPost from "../components/FeaturesPost";
import Loader from "../components/Loader";
import { useParams } from "react-router-dom";

const BlogDetails = () => {
  const [showData, setData] = useState([]);
  const [loading, setLoading] = useState(false);
  const [multipleCatData, setMultipleCatData] = useState([]);
  const { slug } = useParams();
  const [feaArticle, setFearticle] = useState([]);
  const [postCategory, setPostCaegory] = useState([]);

  const categoryList = async () => {
    setLoading(true);
    const post_category_id = 8;
    try {
      const response = await axios.get(`/public/getCategoryList`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setPostCaegory(response.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };

  const FeaturesArticle = async () => {
    setLoading(true);
    const post_category_id = 8;
    try {
      const response = await axios.get(`/public/getPostData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setFearticle(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };
  const multipleCategoryData = async () => {
    setLoading(true);
    const post_category_id = 6;
    try {
      const response = await axios.get(`/public/getMultipleCatData`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setMultipleCatData(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };

  const getRoute = (slug) => {
    if (slug === "countries") return `/country-blog`;
    if (slug === "courses") return `/course-blog`;
    if (slug === "blog") return `/blog`;
    return `/default/${slug}`;
  };
  // Helper function to limit words
  const limitCharacters = (text, charLimit) => {
    if (!text) return "";
    if (text.length <= charLimit) return text;
    return text.substring(0, charLimit) + "...";
  };

  const slugData = slug
    .replace(/-/g, " ")
    .replace(/\b\w/g, (char) => char.toUpperCase());

  const fetechSlugData = async () => {
    setLoading(true);
    try {
      const response = await axios.get(`/public/getSlugData`, {
        params: { slug }, // Passing the parameter as a query string
      });
      console.log("API Details Response:", response.data.data); // Log the response
      setData(response.data.data);
    } catch (error) {
      console.error("Error fetching data", error);
    } finally {
      setLoading(false);
    }
  };
  useEffect(() => {
    categoryList();
    multipleCategoryData();
    FeaturesArticle();
    fetechSlugData();
  }, [slug]);

  return (
    <div>
      {/* Scroll Up Button */}
      <a href="#wrapper" data-type="section-switch" className="scrollup">
        <i className="fas fa-angle-double-up" />
      </a>

      <div id="wrapper" className="wrapper box-layout-child bg--light wrapper">
        <Header />

        <Helmet>
          <title>{slugData}</title>
        </Helmet>

        <div>
          <section className="inner-page-banner bg-common">
            <div className="container">
              <div className="row">
                <div className="col-12">
                  <div className="breadcrumbs-area">
                    <h1>{slugData}</h1>
                    <ul>
                      <li>
                        <Link to="/">Home</Link>
                      </li>
                      <li>{slugData}</li>
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
                            <Link to={`/reading-blog/${item.slug}`}>
                              {item.title}
                            </Link>
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

                <div className="col-xl-4 col-lg-4 sidebar-widget-area sidebar-break-md">
                  <div className="widget">
                    <div className="section-heading heading-dark">
                      <h3 className="item-heading">POPULAR POSTS</h3>
                    </div>
                    <div className="widget-latest">
                      <ul className="block-list">
                        {multipleCatData.slice(0, 10).map((article, index) => (
                          <li className="single-item" key={index}>
                            <div className="item-img">
                              <Link to={`/reading-blog/${article.slug}`}>
                                <img
                                  src={article.image}
                                  alt={article.title}
                                  style={{ height: "50px", width: "80px" }}
                                />
                              </Link>
                            </div>
                            <div className="item-content">
                              <div className="item-title">
                                <Link to={`/reading-blog/${article.slug}`}>
                                  <small>
                                    {limitCharacters(article.title, 50)}
                                  </small>
                                </Link>
                              </div>
                            </div>
                          </li>
                        ))}
                      </ul>
                    </div>
                  </div>
                  <CategorySlug />
                  <div className="widget d-none">
                    <div className="widget-newsletter-subscribe">
                      <h3>Get Latest Updates</h3>
                      <p>Newsletter Subscribe</p>
                      <form className="newsletter-subscribe-form">
                        <div className="form-group">
                          <input
                            type="text"
                            placeholder="your e-mail address"
                            className="form-control"
                            name="email"
                            data-error="E-mail field is required"
                            required
                          />
                          <div className="help-block with-errors" />
                        </div>
                        <div className="form-group mb-none">
                          <button type="submit" className="item-btn">
                            SUBSCRIBE
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                  <div className="widget">
                    <div className="section-heading heading-dark">
                      <h3 className="item-heading">FEATURED ARTICLE</h3>
                    </div>
                    <div className="widget-featured-feed">
                      {feaArticle.map((article, index) => (
                        <div className="featured-box-layout1" key={index}>
                          <div className="item-img">
                            <img
                              src={article.image}
                              alt={article.title}
                              style={{ height: "250px", width: "100%" }}
                              className="img-fluid"
                            />
                          </div>
                          <div className="item-content">
                            <h5 className="item-title">
                              <Link to={`/reading-blog/${article.slug}`}>
                                {limitCharacters(article.title, 50)}
                              </Link>
                            </h5>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>

                {/* <FeaturesPost /> */}
              </div>
            </div>
          </section>
        </div>

        <br />
      </div>
      <br />
      <Footer />
    </div>
  );
};

export default BlogDetails;
