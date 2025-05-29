import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import CategorySlug from "../components/CategorySlug";
import { Helmet } from "react-helmet";
import Loader from "./Loader";

const BlogContent = ({}) => {
  const [blogContent, setBlogData] = useState([]);
  const [feaArticle, setFearticle] = useState([]);
  const [multipleCatData, setMultipleCatData] = useState([]);
  const [postCategory, setPostCaegory] = useState([]);
  const [loading, setLoading] = useState(false);

  
  const getBlogs = async () => {
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
  // Helper function to limit words
  const limitCharacters = (text, charLimit) => {
    if (!text) return "";
    if (text.length <= charLimit) return text;
    return text.substring(0, charLimit) + "...";
  };

  const getRoute = (slug) => {
    if (slug === "countries") return `/country-blog`;
    if (slug === "courses") return `/course-blog`;
    if (slug === "blog") return `/blog`;
    return `/default/${slug}`;
  };

  useEffect(() => {
    getBlogs();
    FeaturesArticle();
    multipleCategoryData();
    categoryList();
  }, []);

  return (
    <>
      {/* Blog Area Start Here */}
      <section className="blog-wrap-layout1">
        <div className="container">
          <div className="row">
            {blogContent.slice(-3).map((blog) => (
              <div className="col-lg-4" key={blog.id}>
                <div className="blog-box-layout1">
                  <div className="item-img">
                    <Link to={`blog-details/${blog.slug}`}>
                      <img
                        src={blog.image}
                        alt="blog"
                        style={{ height: "250px" }}
                      />
                    </Link>
                  </div>
                  <div className="item-content">
                    <h3 className="item-title">
                      <Link to={`/reading-blog/${blog.slug}`}>
                        {" "}
                        {limitCharacters(blog.title, 50)}
                      </Link>
                    </h3>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
      {/* Blog Area End Here */}
      {/* Blog Area Start Here */}
      <section className="blog-wrap-layout2">
        <div className="container">
          <div className="row gutters-40">
            <div className="col-xl-9 col-lg-8">
              {feaArticle.slice(-1).map((article, index) => (
                <div className="blog-box-layout1" key={index}>
                  <div className="item-img">
                    <Link to={`/reading-blog/${article.slug}`}>
                      <img
                        src={article.image}
                        alt="blog"
                        style={{ height: "500px", width: "100%" }}
                      />
                    </Link>
                  </div>
                  <div className="item-content">
                    <h2 className="item-title">
                      <Link to={`/reading-blog/${article.slug}`}>
                        {limitCharacters(article.title, 50)}
                      </Link>
                    </h2>
                    <p
                      dangerouslySetInnerHTML={{
                        __html: limitCharacters(article.description, 400),
                      }}
                    ></p>
                    <Link
                      to={`/reading-blog/${article.slug}`}
                      className="item-btn"
                    >
                      READ MORE
                      <i className="fas fa-arrow-right" />
                    </Link>
                  </div>
                </div>
              ))}

              <div className="row gutters-40">
                {multipleCatData.slice(0, 10).map((article, index) => (
                  <div className="col-sm-6 col-12" key={index}>
                    <div className="blog-box-layout1">
                      <div className="item-img">
                        <Link to={`/reading-blog/${article.slug}`}>
                          <img
                            src={article.image}
                            alt={article.title}
                            style={{ height: "250px", width: "100%" }}
                          />
                        </Link>
                      </div>
                      <div className="item-content">
                        <h3 className="item-title">
                          {" "}
                          <Link to={`/reading-blog/${article.slug}`}>
                            {limitCharacters(article.title, 50)}
                          </Link>
                        </h3>
                        <p
                          style={{ textAlign: "justify" }}
                          dangerouslySetInnerHTML={{
                            __html: limitCharacters(article.description, 400),
                          }}
                        ></p>
                        <Link
                          to={`/reading-blog/${article.slug}`}
                          className="item-btn"
                        >
                          READ MORE
                          <i className="fas fa-arrow-right" />
                        </Link>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
              <br />
              <br />
            </div>
            <div className="col-xl-3 col-lg-4 sidebar-widget-area sidebar-break-md">
              <div className="widget">
                <div className="section-heading heading-dark">
                  <h3 className="item-heading">SUBSCRIBE &amp; FOLLOW</h3>
                </div>
                <div className="widget-follow-us">
                  <ul>
                    <li className="single-item">
                      <a href="#">
                        <i className="fab fa-facebook-f" />
                      </a>
                    </li>
                  </ul>
                </div>
              </div>
              <div className="widget">
                <div className="section-heading heading-dark">
                  <h3 className="item-heading">POPULAR POSTS</h3>
                </div>
                <div className="widget-latest">
                  <ul className="block-list">
                    {multipleCatData.slice(0, 10).map((article, index) => (
                      <li className="single-item" key={index}>
                        <div className="item-img">
                          <a href="#">
                            <img
                              src={article.image}
                              alt={article.title}
                              style={{ height: "50px", width: "80px" }}
                            />
                          </a>
                        </div>
                        <div className="item-content">
                          <div className="item-title">
                            <Link to={`/reading-blog/${article.slug}`}>
                              <small>
                                {limitCharacters(article.title, 20)}
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
              <div className="widget">
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
          </div>
        </div>
      </section>
      {/* Blog Area End Here */}
    </>
  );
};

export default BlogContent;
