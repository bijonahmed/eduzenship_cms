import React, { useRef, useState, useEffect } from "react";
import { Helmet } from "react-helmet";
import GuestNavbar from "../../components/Navbar";
import { Link, useNavigate } from "react-router-dom";
import Footer from "../../components/Footer";
import LeftSideBarComponent from "../../components/LeftSideBarComponent";
import EditorComponent from "../../components/EditorComponent";
import axios from "/config/axiosConfig";
import Swal from "sweetalert2";

const PostAdd = () => {
    const [errors, setErrors] = useState({});
    const [name, setName] = useState("");
    const [post_category_id, setPostCategoryId] = useState("");
    const [description, setDescription] = useState("");
    const [status, setStatus] = useState(1);
    const [image, setImage] = useState(null);
    const [preview, setPreview] = useState(null);
    const [categoryData, setCategoryData] = useState([]);
    const navigate = useNavigate();
    const token = JSON.parse(sessionStorage.getItem("token"));
    const id = "";

    useEffect(() => {
        const fetchCategories = async () => {
            try {
                const response = await axios.get(`/category/getPostCategory`, {
                    headers: {
                        Authorization: `Bearer ${token}`,
                    },
                });
                if (response.data) {
                    setCategoryData(response.data);
                }
            } catch (error) {
                console.error("Error fetching categories:", error);
            }
        };
        fetchCategories();
    }, [token]);

    const handleImageChange = (e) => {
        const file = e.target.files[0];
        if (file && file.type.startsWith("image/")) {
            setImage(file);
            setPreview(URL.createObjectURL(file));
        } else {
            Swal.fire({
                icon: "error",
                title: "Invalid File Type",
                text: "Only image files are allowed (jpg, jpeg, png, gif).",
            });
            e.target.value = null;
            setImage(null);
            setPreview(null);
        }
    };

    const handleSubmit = async (e) => {
        e.preventDefault();

        const formData = new FormData();
        formData.append("id", id);
        formData.append("name", name);
        formData.append("post_category_id", post_category_id);
        formData.append("description", description);
        formData.append("status", status);

        if (image) {
            formData.append("image", image);
        }

        try {
            const response = await axios.post("/post/postInsert", formData, {
                headers: {
                    Authorization: `Bearer ${token}`,
                    "Content-Type": "multipart/form-data",
                },
            });

            Swal.fire({
                toast: true,
                icon: "success",
                title: "Your data has been successfully saved.",
                position: "top-end",
                showConfirmButton: false,
                timer: 3000,
            });

            setName("");
            setStatus("");
            setImage(null);
            setPreview(null);
            setErrors({});
            navigate("/post/post-list");

        } catch (error) {
            if (error.response && error.response.status === 422) {
                Swal.fire({
                    icon: "error",
                    title: "Validation Errors",
                    html: Object.values(error.response.data.errors)
                        .map((err) => `<div>${err.join("<br>")}</div>`)
                        .join(""),
                });
                setErrors(error.response.data.errors);
            } else {
                console.error("Submission error:", error);
            }
        }
    };

    return (
        <>
            <Helmet>
                <title>Add Post</title>
            </Helmet>

            <div className="wrapper">
                <LeftSideBarComponent />
                <header>
                    <GuestNavbar />
                </header>

                <div className="page-wrapper">
                    <div className="page-content">
                        <div className="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                            <div className="breadcrumb-title pe-3">Post</div>
                            <div className="ps-3">
                                <nav aria-label="breadcrumb">
                                    <ol className="breadcrumb mb-0 p-0">
                                        <li className="breadcrumb-item">
                                            <Link to="/dashboard"><i className="bx bx-home-alt" /></Link>
                                        </li>
                                        <li className="breadcrumb-item active" aria-current="page">Add New</li>
                                    </ol>
                                </nav>
                            </div>
                            <div className="ms-auto">
                                <button type="button" className="btn btn-black" onClick={() => navigate('/post/post-list')}>
                                    Back
                                </button>
                            </div>
                        </div>

                        <div className="card radius-10">
                            <div className="card-body p-4">
                                <form onSubmit={handleSubmit}>
                                    <div className="row mb-3">
                                        <label className="col-sm-3 col-form-label">Post Title</label>
                                        <div className="col-sm-9">
                                            <input
                                                type="text"
                                                className="form-control"
                                                placeholder="Enter Title"
                                                value={name}
                                                onChange={(e) => setName(e.target.value)}
                                            />
                                            {errors.name && <div style={{ color: "red" }}>{errors.name[0]}</div>}
                                        </div>
                                    </div>

                                    <div className="row mb-3">
                                        <label className="col-sm-3 col-form-label">Post Category</label>
                                        <div className="col-sm-9">
                                            <select
                                                className="form-select"
                                                value={post_category_id}
                                                onChange={(e) => setPostCategoryId(e.target.value)}
                                            >
                                                <option value="">Select Post Category</option>
                                                {categoryData.map((category) => (
                                                    <option key={category.id} value={category.id}>
                                                        {category.name}
                                                    </option>
                                                ))}
                                            </select>
                                            {errors.post_category_id && <div style={{ color: "red" }}>{errors.post_category_id[0]}</div>}
                                        </div>
                                    </div>

                                    <div className="row mb-3">
                                        <label className="col-sm-3 col-form-label">Description</label>
                                        <div className="col-sm-9">
                                            <EditorComponent value={description} onChange={setDescription} />
                                            {errors.description && <div style={{ color: "red" }}>{errors.description[0]}</div>}
                                        </div>
                                    </div>

                                    <div className="row mb-3">
                                        <label className="col-sm-3 col-form-label">Image Upload</label>
                                        <div className="col-sm-9">
                                            <input
                                                type="file"
                                                accept="image/*"
                                                onChange={handleImageChange}
                                                className="form-control"
                                            />
                                            {preview && (
                                                <img
                                                    src={preview}
                                                    alt="Preview"
                                                    style={{ maxWidth: "200px", marginTop: "10px", borderRadius: "8px" }}
                                                />
                                            )}
                                            {errors.image && <div style={{ color: "red" }}>{errors.image[0]}</div>}
                                        </div>
                                    </div>

                                    <div className="row mb-3">
                                        <label className="col-sm-3 col-form-label">Status</label>
                                        <div className="col-sm-9">
                                            <select
                                                className="form-select"
                                                value={status}
                                                onChange={(e) => setStatus(e.target.value)}
                                            >
                                                <option value="">Select Status</option>
                                                <option value="1">Active</option>
                                                <option value="0">Inactive</option>
                                            </select>
                                            {errors.status && <div style={{ color: "red" }}>{errors.status[0]}</div>}
                                        </div>
                                    </div>

                                    <div className="row">
                                        <label className="col-sm-3 col-form-label" />
                                        <div className="col-sm-9">
                                            <button type="submit" className="btn btn-primary px-4">Submit</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>

                <div className="overlay toggle-icon" />
                <Link to="#" className="back-to-top"><i className="bx bxs-up-arrow-alt" /></Link>
                <Footer />
            </div>
        </>
    );
};

export default PostAdd;
