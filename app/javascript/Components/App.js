import React, { useState, useEffect } from 'react'
import axios from 'axios'

const App = () => {

    const [authors, setAuthors] = useState([])

    useEffect(() => {
        axios.get('/api/v1/authors')
            .then(response => {
                setAuthors(response.data.data)
            })
            .catch(response => {
                console.log(response)
            })
    }, [])

    const list = authors.map( author => {
        return( author.attributes.name )
    })

    return(
        <div><br />Bem vindo ao React <br />{ list }</div>
    )
}

export default App