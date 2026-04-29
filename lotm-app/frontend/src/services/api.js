import axios from 'axios';

const API_URL = 'http://localhost:8080/api';

export const api = {
  getPathways: async () => {
    const response = await axios.get(`${API_URL}/pathways`);
    return response.data;
  },
  
  getSequences: async (pathwayId) => {
    const response = await axios.get(`${API_URL}/pathways/${pathwayId}/sequences`);
    return response.data;
  },

  getMembers: async () => {
    const response = await axios.get(`${API_URL}/members`);
    return response.data;
  },

  getArtifacts: async () => {
    const response = await axios.get(`${API_URL}/artifacts`);
    return response.data;
  },

  insertData: async (password, payload) => {
    const response = await axios.post(`${API_URL}/insert`, payload, {
      headers: {
        'X-Admin-Password': password,
        'Content-Type': 'application/json'
      }
    });
    return response.data;
  }
};
