<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZeroMiette - Donor Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            display: flex;
            background-color: #a29a81;
            min-height: 100vh;
        }

        .sidebar {
            background-color: #265442;
            width: 240px;
            padding: 20px 0;
            transition: all 0.3s ease;
        }

        .sidebar-header {
            padding: 20px;
            text-align: center;
            color: rgb(220, 216, 206);
            font-weight: bold;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .sidebar-menu {
            list-style-type: none;
        }

        .sidebar-item {
            position: relative;
            margin: 5px 0;
        }

        .sidebar-link {
            display: flex;
            align-items: center;
            padding: 15px 20px;
            color: white;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 500;
            font-size: 13px;
        }

        .sidebar-link i {
            margin-right: 8px;
            font-size: 18px;
        }

        .sidebar-link.active {
            background-color: #f0f2f5;
            color: #3dd598;
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
        }

        .sidebar-link.active::before {
            content: "";
            position: absolute;
            right: 0;
            top: -20px;
            height: 20px;
            width: 20px;
            background-color: transparent;
            border-bottom-right-radius: 20px;
            box-shadow: 7px 7px 0 7px #f0f2f5;
        }

        .sidebar-link.active::after {
            content: "";
            position: absolute;
            right: 0;
            bottom: -20px;
            height: 20px;
            width: 20px;
            background-color: transparent;
            border',
            'border-top-right-radius: 20px;
            box-shadow: 7px -7px 0 7px #f0f2f5;
        }

        .content {
            flex: 1;
            padding: 20px;
            background-color: #f0f2f5;
        }

        .page {
            display: none;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
        }

        .page.active {
            display: block;
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .profile-header img {
            border-radius: 50%;
            margin-right: 10px;
        }

        .donation-prompt {
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            cursor: pointer;
            color: #555;
            font-size: 16px;
        }

        .donation-prompt:hover {
            background-color: #f8f8f8;
        }

        .announcement-card img.food-img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .announcement-card .card-header {
            display: flex;
            align-items: center;
            background-color: transparent;
            border-bottom: none;
        }

        .announcement-card .card-header img {
            width: 30px;
            height: 30px;
        }

        .announcement-card .card-header small {
            margin-left: auto;
        }

        .modal-backdrop {
            background-color: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(5px);
        }

        .modal-content {
            border-radius: 10px;
        }

        .modal-body input,
        .modal-body textarea {
            margin-bottom: 10px;
        }

        .request-card {
            display: flex;
            align-items: center;
            margin-bottom: 10px;
            padding: 10px;
            background-color: #f8f8f8;
            border-radius: 5px;
        }

        .request-card img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .request-card .request-info {
            flex: 1;
        }

        .request-card .request-actions {
            margin-left: 10px;
        }

        .request-card .status {
            font-size: 12px;
            color: #555;
        }

        .dropdown-toggle::after {
            display: none;
        }

        .dropdown-menu {
            min-width: 100px;
        }

        .announcement-card .dropdown {
            position: absolute;
            top: 10px;
            right: 10px;
        }

        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
            }

            .sidebar-link span {
                display: none;
            }

            .sidebar-link i {
                margin-right: 0;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <div class="sidebar">
        <div class="sidebar-header">
            <span>ZeroMiette</span>
        </div>
        <ul class="sidebar-menu">
            <li class="sidebar-item">
                <a href="#dashboard" class="sidebar-link active" data-page="dashboard">
                    <i class="fas fa-home"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li class="sidebar-item">
                <a href="#myAnnouncements" class="sidebar-link" data-page="myAnnouncements">
                    <i class="fas fa-list"></i>
                    <span>My Announcements</span>
                </a>
            </li>
             <li class="sidebar-item">
                <a href="#myProfileSettings" class="sidebar-link" data-page="myProfileSettings">
                    <i class="fa-solid fa-user"></i>
                    <span>My Profile Settings</span>
                </a>
            </li>
        </ul>
    </div>

    <div class="content">
        <div id="dashboard" class="page active">
            <div class="profile-header">
                <img src="/images/default-profile.jpg" alt="Profile" width="50">
                <span>DonorUsername</span>
            </div>
            <div class="donation-prompt" data-bs-toggle="modal" data-bs-target="#createAnnouncementModal">
                Got any donation today?
            </div>
            <div class="row mt-3">
                <div class="col-md-4">
                    <div class="card announcement-card">
                        <div class="card-header">
                            <img src="/images/default-profile.jpg" alt="Profile">
                            <span class="ms-2">DonorUsername</span>
                            <small>2025-04-25</small>
                        </div>
                        <img src="/images/sample-food.jpg" class="food-img" alt="Food">
                        <div class="card-body">
                            <h5 class="card-title">Fresh Apples</h5>
                            <p class="card-text">10 kg of fresh apples, perfect for donation.</p>
                            <p><strong>Quantity:</strong> 10 kg</p>
                            <p><strong>Recipient Type:</strong> Human</p>
                            <span class="badge bg-success">Available</span>
                            <div class="dropdown">
                                <button class="btn btn-link" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#" onclick="editAnnouncement()">Edit</a></li>
                                    <li><a class="dropdown-item" href="#" onclick="deleteAnnouncement()">Delete</a></li>
                                </ul>
                            </div>
                            <button class="btn btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#requestsModal">Requests</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="myAnnouncements" class="page">
            <h1>My Announcements</h1>
            <div class="row mt-3">
             
                <div class="col-md-4">
                    <div class="card announcement-card">
                        <div class="card-header">
                            <img src="/images/default-profile.jpg" alt="Profile">
                            <span class="ms-2">DonorUsername</span>
                            <small>2025-04-25</small>
                        </div>
                        <img src="/images/sample-food.jpg" class="food-img" alt="Food">
                        <div class="card-body">
                            <h5 class="card-title">Fresh Apples</h5>
                            <p class="card-text">10 kg of fresh apples.</p>
                            <p><strong>Quantity:</strong> 10 kg</p>
                            <p><strong>Recipient Type:</strong> Human</p>
                            <span class="badge bg-success">Available</span>
                            <div class="dropdown">
                                <button class="btn btn-link" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#" onclick="editAnnouncement()">Edit</a></li>
                                    <li><a class="dropdown-item" href="#" onclick="deleteAnnouncement()">Delete</a></li>
                                </ul>
                            </div>
                            <button class="btn btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#requestsModal">Requests</button>
                        </div>
                    </div>
                </div>
                <!-- Expired Announcement -->
                <div class="col-md-4">
                    <div class="card announcement-card">
                        <div class="card-header">
                            <img src="/images/default-profile.jpg" alt="Profile">
                            <span class="ms-2">DonorUsername</span>
                            <small>2025-04-20</small>
                        </div>
                        <img src="/images/expired-food.jpg" class="food-img" alt="Food">
                        <div class="card-body">
                            <h5 class="card-title">Old Bread</h5>
                            <p class="card-text">5 loaves of bread.</p>
                            <p><strong>Quantity:</strong> 5 loaves</p>
                            <p><strong>Recipient Type:</strong> Animal</p>
                            <span class="badge bg-danger">Expired</span>
                            <div class="dropdown">
                                <button class="btn btn-link" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-ellipsis-v"></i>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="#" onclick="editAnnouncement()">Edit</a></li>
                                    <li><a class="dropdown-item" href="#" onclick="deleteAnnouncement()">Delete</a></li>
                                </ul>
                            </div>
                            <button class="btn btn-secondary mt-2" data-bs-toggle="modal" data-bs-target="#requestsModal">Requests</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="createAnnouncementModal" tabindex="-1" aria-labelledby="createAnnouncementModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="/donor/createAnnouncement" method="post" enctype="multipart/form-data" id="announcementForm">
                        <div class="modal-header">
                            <h5 class="modal-title" id="createAnnouncementModalLabel">Create Announcement</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <input type="text" name="title" class="form-control" placeholder="Title" required>
                            <textarea name="content" class="form-control" placeholder="Content" required></textarea>
                            <input type="text" name="quantity" class="form-control" placeholder="Quantity (e.g., 10 kg)" required>
                            <input type="file" name="photo" class="form-control" accept="image/*">
                            <input type="datetime-local" name="deadline" class="form-control" required>
                            <div class="mb-3">
                                <label class="form-label">Recipient Type</label>
                                <div>
                                    <input type="radio" name="recipient_type" id="human" value="human" required>
                                    <label for="human">Human</label>
                                    <input type="radio" name="recipient_type" id="animal" value="animal">
                                    <label for="animal">Animal</label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary" id="formSubmitButton">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

     
        <div class="modal fade" id="requestsModal" tabindex="-1" aria-labelledby="requestsModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="requestsModalLabel">Requests for Announcement</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
     
                        <h6>Pending Requests</h6>
                        <div class="request-card">
                            <img src="/images/default-profile.jpg" alt="Profile">
                            <div class="request-info">
                                <strong>Demandeur1</strong>
                                <small class="text-muted">2025-04-25</small>
                                <p>Interested in the apples for a community kitchen.</p>
                                <div class="status">Pending</div>
                            </div>
                            <div class="request-actions">
                                <a href="/donor/acceptRequest?id=1" class="btn btn-success btn-sm">Accept</a>
                                <a href="/donor/refuseRequest?id=1" class="btn btn-danger btn-sm">Refuse</a>
                            </div>
                        </div>
                        <!-- Accepted Requests -->
                        <h6 class="mt-3">Accepted Requests</h6>
                        <div class="request-card">
                            <img src="/images/default-profile.jpg" alt="Profile">
                            <div class="request-info">
                                <strong>Demandeur2</strong>
                                <small class="text-muted">2025-04-24</small>
                                <p>Will use the apples for a local shelter.</p>
                                <p><strong>Contact:</strong> demandeur2@example.com</p>
                                <div class="status">Accepted</div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const sidebarLinks = document.querySelectorAll('.sidebar-link');
            const pages = document.querySelectorAll('.page');

            sidebarLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    sidebarLinks.forEach(item => item.classList.remove('active'));
                    this.classList.add('active');
                    const pageId = this.getAttribute('data-page');
                    pages.forEach(page => {
                        page.classList.remove('active');
                        if (page.id === pageId) {
                            page.classList.add('active');
                        }
                    });
                });
            });

            function deleteAnnouncement() {
                alert("Announcement successfully deleted");
            }

            function editAnnouncement() {
                document.querySelector('#createAnnouncementModal .modal-title').textContent = "Edit Announcement";
                document.querySelector('#createAnnouncementModal input[name=title]').value = "Fresh Apples";
                document.querySelector('#createAnnouncementModal textarea[name=content]').value = "10 kg of fresh apples.";
                document.querySelector('#createAnnouncementModal input[name=quantity]').value = "10 kg";
                document.querySelector('#createAnnouncementModal input[name=deadline]').value = "2025-04-25T12:00";
                document.querySelector('#createAnnouncementModal input[name=recipient_type][value=human]').checked = true;
                document.querySelector('#formSubmitButton').textContent = "Save Changes";
                document.querySelector('#announcementForm').action = "/donor/editAnnouncement";
                var myModal = new bootstrap.Modal(document.getElementById('createAnnouncementModal'));
                myModal.show();
            }

            document.querySelector('.donation-prompt').addEventListener('click', function() {
                document.querySelector('#createAnnouncementModal .modal-title').textContent = "Create Announcement";
                document.querySelector('#announcementForm').reset();
                document.querySelector('#formSubmitButton').textContent = "Submit";
                document.querySelector('#announcementForm').action = "/donor/createAnnouncement";
            });
        });
    </script>
</body>
</html>