import datetime
from math import remainder
import math
from turtle import pos

from flask import Flask, render_template, request, redirect, flash, template_rendered, url_for, session
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
from datetime import datetime
import os
import math

# local_server = True

with open('config.json', 'r') as c:
    params = json.load(c)["Params"]

LS = params['local_server']

app = Flask(__name__)
app.secret_key = 'many random bytes'
app.config['UPLOAD_FOLDER'] = params['upload_location']

# For SMTP mail receive by user
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    # this is default port of gmail SMTP
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['gmail-user'],
    MAIL_PASSWORD=params['gmail-pass']
)
mail = Mail(app)
if LS:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']

db = SQLAlchemy(app)


class Contacts(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Name = db.Column(db.String(40), nullable=False)
    Email = db.Column(db.String(40), nullable=False)
    Phone_no = db.Column(db.String(20), nullable=False)
    Message = db.Column(db.String(120), nullable=False)
    Date = db.Column(db.String(12), nullable=True)


class Post(db.Model):
    Sno = db.Column(db.Integer, primary_key=True)
    Tittle = db.Column(db.String(40), nullable=False)
    sub_heading = db.Column(db.String(40), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    Content = db.Column(db.String(200), nullable=False)
    Date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)


@app.route("/home")
def home():
    posts = Post.query.filter_by().all()
    last = math.ceil(len(posts)/int(params['no_of_post']))
    # [0:params['no_of_post']]
    page = request.args.get('page')
    if not str(page).isnumeric():
        page = 1
    page=int(page)
    posts = posts[(page-1)*int(params['no_of_post']):(page-1) *int(params['no_of_post']) +int(params['no_of_post'])]
        # PAGING LOGIC

        # FIRST 
    if page==1:
        prev = "#"
        next = "/home?page=" + str(page + 1)

    elif page==last:
         prev = "/home?page=" + str(page - 1)
         next = "#"
    else:

         prev = "/home?page=" + str(page - 1)
         next = "/home?page=" + str(page + 1)


    # posts = Post.query.filter_by().all()[0:params['no_of_post']]
    return render_template('index.html', p=params, posts=posts, prev=prev, next=next)


@app.route("/About")
def about():
    return render_template("about.html", p=params)


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin-user']:
        posts = Post.query.all()
        return render_template('dashboard.html', p=params, posts=posts)
    if request.method == 'POST':
        Auser = request.form.get('uname')
        Apass = request.form.get('pass')
        if Auser == params['admin-user'] and Apass == params['admin-pass']:
            # set the sessiom varible:
            session['user'] = Auser
            posts = Post.query.all()
            return render_template('dashboard.html', p=params, posts=posts)
        else:
            flash("Please Insert correct Admin_User and Admin_Password")

    return render_template("login.html", p=params)


@app.route("/contact", methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        name = request.form.get('name')
        email = request.form.get('email')
        phone_no = request.form.get('phone_no')
        msg = request.form.get('msg')

        entry = Contacts(Name=name, Email=email, Phone_no=phone_no, Message=msg, Date=datetime.now())
        db.session.add(entry)
        db.session.commit()
        mail.send_message('Message From CodingKing Blog by' + name,
                          sender=email,
                          recipients=[params['gmail-user']],
                          body=msg + "\n" + phone_no + "\n" + email
                          )

    return render_template("contact.html", p=params)


@app.route("/AddPost/<string:sno>", methods=['GET', 'POST'])
def AddPost(sno):
    if 'user' in session and session['user'] == params['admin-user']:

        if request.method == "POST":

            box_title = request.form.get('tittle')
            box_S_head = request.form.get('sub_head')
            box_slug = request.form.get('slug')
            box_cont = request.form.get('cont')
            box_image = request.form.get('img_file')
            date = datetime.now()

            if sno == '0':
                post = Post(Tittle=box_title, sub_heading=box_S_head, slug=box_slug, Content=box_cont,
                            img_file=box_image, Date=date)
                db.session.add(post)
                db.session.commit()

        return render_template('AddPost.html', p=params, sno=sno)

        # File Uploader


@app.route("/Uploader", methods=['GET', 'POST'])
def Uploader():
    if 'user' in session and session['user'] == params['admin-user']:
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], f.filename))
            return "uploaessssss"
    return render_template('dashboard.html', p=params)

# LOGOUT ENDpoint 

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')



@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin-user']:
        if request.method == "POST":

            box_title = request.form.get('tittle')
            box_S_head = request.form.get('sub_head')
            box_slug = request.form.get('slug')
            box_cont = request.form.get('cont')
            box_image = request.form.get('img_file')
            date = datetime.now()

            if sno != '0':
                post = Post.query.filter_by(Sno=sno).first()
                post.title = box_title
                post.sub_heading = box_S_head
                post.slug = box_slug
                post.Content = box_cont
                post.img_file = box_image
                post.Date = date
                db.session.commit()
                return redirect('/edit/' + sno)

        post = Post.query.filter_by(Sno=sno).first()

        return render_template('edit.html', p=params, post=post)

#  DELETE POST

@app.route("/delete/<string:sno>", methods=['GET', 'POST'])
def delete(sno):
    if 'user' in session and session['user'] == params['admin-user']:
        post=Post.query.filter_by(Sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect("/dashboard")


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_routr(post_slug):
    post = Post.query.filter_by(slug=post_slug).first()

    return render_template("post.html", p=params, post=post)
    

app.run(debug=True)
