// src/Navbar.js
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import axios from "/config/axiosConfig";
import $ from "jquery";

const CategorySlug = () => {
  const [postCategory, setPostCaegory] = useState([]);
  const categoryList = async () => {
    const post_category_id = 8;
    try {
      const response = await axios.get(`/public/getCategoryList`, {
        params: { post_category_id }, // Passing the parameter as a query string
      });
      //console.log("API Response:", response.data); // Log the response
      setPostCaegory(response.data);
    } catch (error) {
      console.error("Error fetching data", error);
    }
  };
  const getRoute = (slug) => {
    if (slug === "countries") return `/country-blog`;
    if (slug === "courses") return `/course-blog`;
    if (slug === "services") return `/services-blog`;
    if (slug === "our-offerings") return `/offer-blog`;
    if (slug === "blog") return `/blog`;
    return `/`;
  };

  //offer-blog
  useEffect(() => {
    categoryList();
  }, []);

  return (
    <>
      <div className="widget">
        <div className="section-heading heading-dark">
          <h3 className="item-heading">CATEGORIES</h3>
        </div>
        <div className="widget-categories">
          <ul>
            {postCategory.map((data, index) => (
              <li>
                <Link to={getRoute(data.slug)}>{data.name}</Link>
              </li>
            ))}
          </ul>
        </div>
      </div>
    </>
  );
};

export default CategorySlug;
