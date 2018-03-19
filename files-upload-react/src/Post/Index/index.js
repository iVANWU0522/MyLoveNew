import React, { Component } from 'react';
import axiosClient from '../../axiosClient';

class PostIndex extends Component {
    constructor(props) {
        super(props);
        this.state = { posts: [] };
    }

    componentWillMount() {
        axiosClient.get('/posts.json').then(response => {
            this.setState({ posts: response.data });
        });
    }

    render() {
        return (
            <div className="PostIndex col-md-12" style=>
    <div className="clearfix">
            <div className="pull-right">
            <button
        onClick={e => this.handleNewPost()}
        className="btn btn-success">
            New Post
        </button>
        </div>
        </div>
        <table className="table">
            <thead>
            <tr>
            <th>#</th>
            <th>Title</th>
            <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            {this.renderTableBody()}
    </tbody>
        </table>
        </div>
    );
    }

    handleNewPost() {
        this.props.history.push('/posts/new');
    }

    renderTableBody() {
        return this.state.posts.map(post => {
            return (
                <tr key={post.id}>
        <td>
            {post.id}
        </td>
            <td>
            {post.caption}
        </td>
            <td>
            <button
            onClick={e => this.handleEdit(post.id)}
            className="btn btn-primary">
                Edit
                </button>
                &nbsp;
        <button
            onClick={e => this.handleRemove(post.id)}
            className="btn btn-danger">
                Remove
                </button>
                </td>
                </tr>
        );
        });
    }

    handleEdit(postId) {
        this.props.history.push(`/posts/${postId}/edit`);
    }
    handleRemove(postId) {
        let posts = this.state.posts;
        posts = posts.filter(post => {
            return post.id !== postId;
        });
        this.setState({ posts: posts });
        axiosClient.delete(`/posts/${postId}`);
    }
}

export default PostIndex;