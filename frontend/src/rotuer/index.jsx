// src/Router.js
import React, { Fragment } from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
//Frontend
import Index from "../pages/Index.jsx";
import Signup from "../pages/Signup.jsx";
import Forgetpassword from "../pages/Forgetpassword.jsx";
import Register from "../pages/Register";
import Login from "../pages/Login";
import UserLogin from "../pages/UserLogin.jsx";
import Contact from "../pages/Contact.jsx";
import Service from "../pages/Service.jsx";
import About from "../pages/About.jsx";
import Goals from "../pages/Goals.jsx";
import Country from "../pages/Country.jsx";
import Courses from "../pages/Courses.jsx";
import OurServices from "../pages/OurServices.jsx";
import OurOffer from "../pages/OurOffer.jsx";
import Blog from "../pages/Blog.jsx";
import CountryCategory from "../pages/CountryCategory.jsx";
import CourseCategory from "../pages/CourseCategory.jsx";
import ServiceCategory from "../pages/ServiceCategory.jsx";
import OfferCategory from "../pages/OfferCategory.jsx";
import BlogDetails from "../pages/BlogDetails.jsx";
import Details from "../pages/Details.jsx";
import MissionVission from "../pages/MissionVission.jsx";
import ChangePassword from "../pages/users/ChangePassword.jsx";
//For Admin Panel
import Dashboard from "../pages/Dashboard";

import MyProfile from "../pages/users/MyProfile.jsx";


const AppRouter = () => {
  return (
    <Routes>
      {/* <Route path="/" element={<Index />} /> general-categoryAdd*/}
      <Route path="/" element={<Index />} />
      <Route path="/register" element={<Register />} />
      <Route path="/login" element={<Login />} />
      <Route path="/user-login" element={<UserLogin />} />
      <Route path="/signup" element={<Signup />} />
      <Route path="/forget-password" element={<Forgetpassword />} />
      <Route path="/contact" element={<Contact />} />
      <Route path="/service" element={<Service />} />
      <Route path="/about" element={<About />} />
      <Route path="/goals" element={<Goals />} />
      <Route path="/our-offerings" element={<OurOffer />} />
      <Route path="/countries" element={<Country />} />
      <Route path="/courses" element={<Courses />} />
      <Route path="/our-services" element={<OurServices />} />
      <Route path="/mission-vision" element={<MissionVission />} />
      <Route path="/blog" element={<Blog />} />
      <Route path="/country-blog" element={<CountryCategory />} />
      <Route path="/course-blog" element={<CourseCategory />} />
      <Route path="/services-blog" element={<ServiceCategory />} />
      <Route path="/offer-blog" element={<OfferCategory />} />


      <Route path="/blog-details" element={<BlogDetails />} />
      <Route path="/user/change-password" element={<ChangePassword />} />
      <Route path="/user/profile" element={<MyProfile />} />
      <Route path="/details/:slug" element={<Details />} />
      <Route path="/reading-blog/:slug" element={<BlogDetails />} />
      
      {/* 
      <Route path="/user/role-list" element={<RoleList />} />
      <Route path="/user/role-add" element={<RoleAdd />} />
      <Route path="/user/user-add" element={<UserAdd />} />
      <Route path="/user/role-edit/:id" element={<RoleEdit />} />
      <Route path="/user/user-edit/:id" element={<UserEdit />} />
      <Route path="/user/merchant-list" element={<MerchantList />} />
      <Route path="/user/superadmin-list" element={<SuperAdminList />} />
      <Route path="/user/admin-list" element={<AdminList />} /> */}
      {/*  */}
      {/* <Route path="/category/post-category-list" element={<PostCategoryList />} />
      <Route path="/category/post-categoryAdd" element={<PostCategoryAdd />} />
      <Route path="/category/post-category-edit/:id" element={<PostCategoryEdit />} />
      <Route path="/category/general-category-edit/:id" element={<GeneralCategoryEdit />} />
      <Route path="/category/global-category-list" element={<GeneralCategoryList />} />
      <Route path="/post/post-list" element={<PostList />} />
      <Route path="/post/post-add" element={<PostAdd />} />
      <Route path="/post/post-edit/:id" element={<PostEdit />} />
      <Route path="/category/general-category-add" element={<GeneralCategoryAdd />} />
      <Route path="/wallet/global-wallet-address-list" element={<GlobalWalletAddressList />} />
      <Route path="/wallet/global-wallet-address-add" element={<GlobalWalletAddressAdd />} />
      <Route path="/configration/config-api-key-list" element={<ConfigrrationApiKeyList />} />
      <Route path="/configration/config-api-key-add" element={<ConfigrrationApiKeyAdd />} />
      <Route path="/configration/address/merchant-address/:id" element={<BulkAddress />} />
      <Route path="/wallet/global-wallet-edit/:id" element={<GlobalWalletAddressEdit />} /> */}
      <Route path="/dashboard" element={<Dashboard />} />
    </Routes>
  );
};

export default AppRouter;
