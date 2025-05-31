import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import Footer from "../components/Footer";
import Header from "../components/GuestNavbar";
import { Helmet } from "react-helmet";
import Loader from "../components/Loader";
import CategorySlug from "../components/CategorySlug";
const Blog = () => {
  const [feaArticle, setFearticle] = useState([]);
  const [loading, setLoading] = useState(false);
  const [multipleCatData, setMultipleCatData] = useState([]);

  const featuresArticle = async () => {
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

  const postsPerPage = 10;
  const [currentPage, setCurrentPage] = useState(1);

  // Calculate pagination logic
  const indexOfLastPost = currentPage * postsPerPage;
  const indexOfFirstPost = indexOfLastPost - postsPerPage;
  const currentPosts = multipleCatData.slice(indexOfFirstPost, indexOfLastPost);
  const totalPages = Math.ceil(multipleCatData.length / postsPerPage);

  const handleClick = (pageNumber) => {
    setLoading(true);
    setTimeout(() => {
      setCurrentPage(pageNumber);
      setLoading(false);
      window.scrollTo({ top: 0, behavior: "smooth" });
    }, 500); // Simulate delay (optional, can be 0ms if instant)
  };

  // Helper function to limit words
  const limitCharacters = (text, charLimit) => {
    if (!text) return "";
    if (text.length <= charLimit) return text;
    return text.substring(0, charLimit) + "...";
  };
  useEffect(() => {
    featuresArticle();
    multipleCategoryData();
  }, []);

  return (
    <div>
      {/* Scroll Up Button */}
      <a href="#wrapper" data-type="section-switch" className="scrollup">
        <i className="fas fa-angle-double-up" />
      </a>

      <div id="wrapper" className="wrapper box-layout-child bg--light wrapper">
        <Header />

        <Helmet>
          <title>Blog</title>
        </Helmet>

        <div>
          <section className="inner-page-banner bg-common">
            <div className="container-fluid">
              <div className="row">
                <div className="col-12">
                  <div className="breadcrumbs-area">
                    <h1>Blog</h1>
                    <ul>
                      <li>
                        <a href="/">Home</a>
                      </li>
                      <li>Blog</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </section>
          {/* Inne Page Banner Area End Here */}

          {/* Blog Area Start Here */}

          <section className="blog-wrap-layout23">
            <div className="row gutters-50">
              <div className="col-lg-8">
                {/* Start Features Post */}
                {feaArticle.slice(-1).map((article, index) => (
                  <div className="blog-box-layout3" key={index}>
                    <div className="item-img">
                      <img
                        src={article.image}
                        alt="blog"
                        style={{ height: "500px", width: "100%" }}
                      />
                    </div>
                    <div className="item-content">
                      <h2 className="item-title">
                        <a href="#">{limitCharacters(article.title, 50)}</a>
                      </h2>
                      <p
                        style={{ textAlign: "justify" }}
                        dangerouslySetInnerHTML={{
                          __html: limitCharacters(article.description, 400),
                        }}
                      ></p>
                      <div className="action-area">
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
                {/* END Features Post */}

                <>
                  {loading ? (
                    <div className="text-center py-5">
                      <Loader />
                    </div>
                  ) : (
                    <>
                      <div className="row gutters-40" id="no-equal-gallery">
                        {currentPosts.map((article, index) => (
                          <div className="col-sm-6 no-equal-item" key={index}>
                            <div className="blog-box-layout3">
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
                                  <Link to={`/reading-blog/${article.slug}`}>
                                    {limitCharacters(article.title, 50)}
                                  </Link>
                                </h3>
                                <p
                                  style={{ textAlign: "justify" }}
                                  dangerouslySetInnerHTML={{
                                    __html: limitCharacters(
                                      article.description,
                                      400
                                    ),
                                  }}
                                ></p>
                                <div className="action-area">
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
                          </div>
                        ))}
                      </div>

                      {/* Pagination */}
                      <div className="pagination-layout1 mt-4">
                        <ul>
                          {Array.from({ length: totalPages }, (_, i) => (
                            <li
                              key={i + 1}
                              className={currentPage === i + 1 ? "active" : ""}
                              onClick={() => handleClick(i + 1)}
                              style={{ cursor: "pointer" }}
                            >
                              <a>{i + 1}</a>
                            </li>
                          ))}
                        </ul>
                      </div>
                    </>
                  )}
                </>
              </div>

              <div className="col-lg-4 sidebar-widget-area sidebar-break-md">
                <div className="widget">
                  <div className="section-heading heading-dark">
                    <h3 className="item-heading">POPULAR POSTS</h3>
                  </div>
                  <div className="widget-popular">
                    {multipleCatData.slice(0, 10).map((article, index) => (
                      <div className="post-box" key={index}>
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
                            <Link to={`/reading-blog/${article.slug}`}>
                              {limitCharacters(article.title, 50)}
                            </Link>
                          </h3>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
                 <CategorySlug/>
              </div>
            </div>
          </section>

          {/* END */}
        </div>
      </div>

      <Footer />
    </div>
  );
};

export default Blog;
