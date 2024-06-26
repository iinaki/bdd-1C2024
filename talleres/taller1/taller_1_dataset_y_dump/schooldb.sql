--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Debian 14.8-1.pgdg120+1)
-- Dumped by pg_dump version 14.8 (Debian 14.8-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: courses; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    name character varying(100),
    instructor_id integer,
    credits integer
);


ALTER TABLE public.courses OWNER TO admin;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO admin;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: enrollments; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.enrollments (
    id integer NOT NULL,
    student_id integer,
    course_id integer,
    enrollment_date date NOT NULL,
    finish_date date,
    grade integer,
    CONSTRAINT enrollments_grade_check CHECK (((grade >= 0) AND (grade <= 10)))
);


ALTER TABLE public.enrollments OWNER TO admin;

--
-- Name: enrollments_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.enrollments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enrollments_id_seq OWNER TO admin;

--
-- Name: enrollments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.enrollments_id_seq OWNED BY public.enrollments.id;


--
-- Name: instructors; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.instructors (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50)
);


ALTER TABLE public.instructors OWNER TO admin;

--
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.instructors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructors_id_seq OWNER TO admin;

--
-- Name: instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.instructors_id_seq OWNED BY public.instructors.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    date_of_birth date,
    email character varying(255),
    address character varying(255) DEFAULT NULL::character varying,
    phone character varying(100) DEFAULT NULL::character varying,
    active boolean DEFAULT true,
    gender character varying(10) DEFAULT NULL::character varying,
    height integer
);


ALTER TABLE public.students OWNER TO admin;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO admin;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: enrollments id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments ALTER COLUMN id SET DEFAULT nextval('public.enrollments_id_seq'::regclass);


--
-- Name: instructors id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.instructors ALTER COLUMN id SET DEFAULT nextval('public.instructors_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.courses (id, name, instructor_id, credits) FROM stdin;
1	Math	1	3
2	History	2	4
3	Philosophy	3	3
4	Physics	1	3
5	Chemistry	1	4
6	Literature	4	3
7	Computer Science	5	3
8	Biology	6	4
9	Economics	7	3
10	Art	8	2
11	Music	9	2
12	Physical Education	10	2
13	Music	2	3
14	Geography	4	3
\.


--
-- Data for Name: enrollments; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.enrollments (id, student_id, course_id, enrollment_date, finish_date, grade) FROM stdin;
1	1	4	2022-03-09	2022-12-14	7
2	1	5	2022-03-11	2022-12-13	6
3	1	1	2022-03-07	2022-12-16	2
4	1	10	2022-03-09	2022-12-16	0
5	2	1	2022-03-11	2022-12-14	3
6	2	2	2022-03-10	2022-12-13	1
7	2	3	2022-03-09	2022-12-15	1
8	2	4	2022-03-09	2022-12-13	9
9	3	2	2022-03-09	2022-12-14	6
10	3	14	2022-03-08	2022-12-13	10
11	3	10	2022-03-11	2022-12-14	3
12	3	13	2022-03-07	2022-12-14	2
13	4	12	2022-03-10	2022-12-12	9
14	4	5	2022-03-09	2022-12-14	6
15	4	4	2022-03-07	2022-12-15	0
16	4	2	2022-03-10	2022-12-12	8
17	5	6	2022-03-10	2022-12-15	2
18	5	3	2022-03-11	2022-12-15	1
19	5	10	2022-03-11	2022-12-15	6
20	5	9	2022-03-10	2022-12-13	5
21	6	11	2022-03-08	2022-12-16	1
22	6	10	2022-03-10	2022-12-16	5
23	6	3	2022-03-08	2022-12-15	6
24	6	14	2022-03-08	2022-12-13	7
25	7	4	2022-03-07	2022-12-16	5
26	7	2	2022-03-10	2022-12-15	10
27	7	2	2022-03-10	2022-12-12	1
28	7	5	2022-03-10	2022-12-16	8
29	8	9	2022-03-08	2022-12-16	5
30	8	12	2022-03-07	2022-12-13	0
31	8	5	2022-03-08	2022-12-13	6
32	8	10	2022-03-08	2022-12-12	3
33	9	2	2022-03-10	2022-12-12	7
34	9	8	2022-03-09	2022-12-16	7
35	9	9	2022-03-08	2022-12-15	5
36	9	5	2022-03-07	2022-12-12	0
37	10	11	2022-03-10	2022-12-12	0
38	10	13	2022-03-11	2022-12-16	2
39	10	2	2022-03-10	2022-12-16	3
40	10	1	2022-03-11	2022-12-16	6
41	11	3	2022-03-11	2022-12-14	5
42	11	12	2022-03-09	2022-12-15	3
43	11	6	2022-03-11	2022-12-14	4
44	11	9	2022-03-09	2022-12-15	7
45	12	7	2022-03-08	2022-12-13	7
46	12	14	2022-03-10	2022-12-14	5
47	12	5	2022-03-07	2022-12-16	6
48	12	6	2022-03-10	2022-12-16	4
49	13	11	2022-03-08	2022-12-16	4
50	13	8	2022-03-11	2022-12-12	1
51	13	13	2022-03-10	2022-12-15	1
52	13	2	2022-03-08	2022-12-13	4
53	14	1	2022-03-10	2022-12-15	8
54	14	5	2022-03-08	2022-12-13	0
55	14	11	2022-03-08	2022-12-13	8
56	14	9	2022-03-11	2022-12-12	3
57	15	4	2022-03-08	2022-12-14	4
58	15	7	2022-03-10	2022-12-15	6
59	15	6	2022-03-10	2022-12-13	6
60	15	5	2022-03-10	2022-12-12	4
61	16	14	2022-03-10	2022-12-15	9
62	16	8	2022-03-11	2022-12-12	0
63	16	13	2022-03-11	2022-12-14	6
64	16	5	2022-03-11	2022-12-14	4
65	17	13	2022-03-07	2022-12-16	8
66	17	1	2022-03-09	2022-12-14	0
67	17	2	2022-03-07	2022-12-13	10
68	17	5	2022-03-10	2022-12-12	1
69	18	3	2022-03-10	2022-12-16	6
70	18	1	2022-03-10	2022-12-14	3
71	18	12	2022-03-09	2022-12-12	2
72	18	7	2022-03-08	2022-12-13	3
73	19	9	2022-03-08	2022-12-15	1
74	19	4	2022-03-11	2022-12-15	8
75	19	6	2022-03-07	2022-12-13	6
76	19	5	2022-03-10	2022-12-13	1
77	20	3	2022-03-08	2022-12-15	2
78	20	2	2022-03-07	2022-12-15	2
79	20	7	2022-03-10	2022-12-16	9
80	20	4	2022-03-07	2022-12-14	10
81	21	14	2022-03-11	2022-12-15	7
82	21	5	2022-03-07	2022-12-12	1
83	21	12	2022-03-09	2022-12-13	7
84	21	5	2022-03-08	2022-12-12	10
85	22	2	2022-03-11	2022-12-12	7
86	22	6	2022-03-08	2022-12-12	7
87	22	14	2022-03-07	2022-12-13	8
88	22	2	2022-03-07	2022-12-12	2
89	23	4	2022-03-07	2022-12-14	1
90	23	10	2022-03-08	2022-12-14	0
91	23	1	2022-03-11	2022-12-15	0
92	23	7	2022-03-07	2022-12-14	10
93	24	6	2022-03-10	2022-12-12	3
94	24	8	2022-03-08	2022-12-13	3
95	24	5	2022-03-08	2022-12-15	6
96	24	9	2022-03-11	2022-12-15	10
97	25	1	2022-03-09	2022-12-14	9
98	25	3	2022-03-07	2022-12-12	5
99	25	2	2022-03-07	2022-12-15	6
100	25	7	2022-03-09	2022-12-13	4
101	26	10	2022-03-07	2022-12-13	1
102	26	13	2022-03-08	2022-12-15	8
103	26	11	2022-03-09	2022-12-14	6
104	26	1	2022-03-11	2022-12-16	6
105	27	6	2022-03-11	2022-12-15	8
106	27	8	2022-03-11	2022-12-13	2
107	27	14	2022-03-11	2022-12-14	6
108	27	4	2022-03-11	2022-12-12	0
109	28	1	2022-03-08	2022-12-16	9
110	28	7	2022-03-10	2022-12-16	6
111	28	5	2022-03-10	2022-12-15	4
112	28	10	2022-03-09	2022-12-13	7
113	29	5	2022-03-09	2022-12-14	10
114	29	10	2022-03-11	2022-12-12	3
115	29	7	2022-03-10	2022-12-13	3
116	29	13	2022-03-10	2022-12-14	10
117	30	1	2022-03-10	2022-12-15	1
118	30	3	2022-03-07	2022-12-14	0
119	30	4	2022-03-09	2022-12-13	9
120	30	12	2022-03-10	2022-12-16	0
121	31	14	2022-03-10	2022-12-15	5
122	31	3	2022-03-07	2022-12-13	5
123	31	10	2022-03-08	2022-12-15	9
124	31	12	2022-03-09	2022-12-12	10
125	32	7	2022-03-10	2022-12-14	5
126	32	13	2022-03-07	2022-12-14	5
127	32	6	2022-03-07	2022-12-14	0
128	32	5	2022-03-08	2022-12-14	9
129	33	8	2022-03-11	2022-12-15	4
130	33	4	2022-03-10	2022-12-16	4
131	33	6	2022-03-09	2022-12-12	7
132	33	5	2022-03-07	2022-12-14	0
133	34	9	2022-03-09	2022-12-14	9
134	34	13	2022-03-07	2022-12-13	3
135	34	8	2022-03-07	2022-12-13	5
136	34	4	2022-03-08	2022-12-16	0
137	35	2	2022-03-11	2022-12-12	0
138	35	5	2022-03-11	2022-12-15	8
139	35	1	2022-03-11	2022-12-12	3
140	35	7	2022-03-08	2022-12-16	2
141	36	14	2022-03-09	2022-12-12	1
142	36	4	2022-03-11	2022-12-14	1
143	36	5	2022-03-11	2022-12-15	0
144	36	13	2022-03-09	2022-12-16	7
145	37	10	2022-03-07	2022-12-12	5
146	37	13	2022-03-07	2022-12-12	2
147	37	9	2022-03-08	2022-12-15	10
148	37	5	2022-03-10	2022-12-15	2
149	38	3	2022-03-11	2022-12-15	6
150	38	9	2022-03-08	2022-12-15	6
151	38	8	2022-03-08	2022-12-16	0
152	38	4	2022-03-10	2022-12-16	8
153	39	2	2022-03-11	2022-12-14	1
154	39	7	2022-03-11	2022-12-13	0
155	39	1	2022-03-08	2022-12-14	2
156	39	8	2022-03-10	2022-12-15	1
157	40	2	2022-03-11	2022-12-15	10
158	40	9	2022-03-07	2022-12-14	3
159	40	5	2022-03-09	2022-12-15	1
160	40	13	2022-03-08	2022-12-14	9
161	41	6	2022-03-08	2022-12-16	4
162	41	7	2022-03-07	2022-12-15	7
163	41	8	2022-03-11	2022-12-13	0
164	41	13	2022-03-10	2022-12-16	3
165	42	4	2022-03-09	2022-12-14	2
166	42	14	2022-03-08	2022-12-12	4
167	42	2	2022-03-11	2022-12-12	0
168	42	7	2022-03-09	2022-12-15	8
169	43	2	2022-03-08	2022-12-12	7
170	43	13	2022-03-08	2022-12-16	3
171	43	12	2022-03-10	2022-12-14	3
172	43	8	2022-03-07	2022-12-12	3
173	44	6	2022-03-11	2022-12-13	9
174	44	9	2022-03-10	2022-12-15	1
175	44	7	2022-03-10	2022-12-12	3
176	44	10	2022-03-11	2022-12-13	5
177	45	6	2022-03-08	2022-12-16	2
178	45	11	2022-03-11	2022-12-13	7
179	45	4	2022-03-11	2022-12-15	2
180	45	1	2022-03-09	2022-12-15	8
181	46	10	2022-03-09	2022-12-16	1
182	46	6	2022-03-07	2022-12-14	7
183	46	5	2022-03-10	2022-12-15	9
184	46	12	2022-03-08	2022-12-15	7
185	47	12	2022-03-11	2022-12-15	2
186	47	10	2022-03-09	2022-12-16	5
187	47	1	2022-03-11	2022-12-16	2
188	47	2	2022-03-07	2022-12-12	8
189	48	1	2022-03-10	2022-12-14	4
190	48	6	2022-03-09	2022-12-13	5
191	48	9	2022-03-09	2022-12-15	4
192	48	3	2022-03-07	2022-12-13	8
193	49	2	2022-03-11	2022-12-12	2
194	49	1	2022-03-11	2022-12-13	9
195	49	3	2022-03-07	2022-12-15	9
196	49	4	2022-03-10	2022-12-15	9
197	50	1	2022-03-10	2022-12-15	1
198	50	5	2022-03-10	2022-12-12	4
199	50	6	2022-03-11	2022-12-12	1
200	50	14	2022-03-11	2022-12-12	0
201	51	14	2022-03-08	2022-12-14	7
202	51	13	2022-03-09	2022-12-12	3
203	51	5	2022-03-11	2022-12-14	3
204	51	6	2022-03-11	2022-12-12	3
205	52	3	2022-03-09	2022-12-13	1
206	52	13	2022-03-07	2022-12-15	2
207	52	10	2022-03-10	2022-12-15	0
208	52	7	2022-03-11	2022-12-13	5
209	53	14	2022-03-08	2022-12-12	2
210	53	2	2022-03-07	2022-12-15	5
211	53	11	2022-03-10	2022-12-13	2
212	53	13	2022-03-08	2022-12-13	4
213	54	11	2022-03-11	2022-12-12	0
214	54	4	2022-03-08	2022-12-12	1
215	54	9	2022-03-08	2022-12-14	6
216	54	12	2022-03-07	2022-12-15	9
217	55	10	2022-03-07	2022-12-15	10
218	55	13	2022-03-10	2022-12-16	5
219	55	5	2022-03-08	2022-12-12	0
220	55	9	2022-03-09	2022-12-14	8
221	56	10	2022-03-08	2022-12-15	6
222	56	3	2022-03-07	2022-12-14	4
223	56	1	2022-03-11	2022-12-16	3
224	56	14	2022-03-10	2022-12-13	2
225	57	9	2022-03-10	2022-12-15	3
226	57	13	2022-03-07	2022-12-15	10
227	57	6	2022-03-08	2022-12-13	10
228	57	1	2022-03-09	2022-12-14	3
229	58	10	2022-03-11	2022-12-15	6
230	58	11	2022-03-09	2022-12-15	9
231	58	8	2022-03-08	2022-12-13	9
232	58	7	2022-03-10	2022-12-13	2
233	59	14	2022-03-11	2022-12-16	2
234	59	5	2022-03-07	2022-12-12	1
235	59	10	2022-03-10	2022-12-14	0
236	59	7	2022-03-11	2022-12-12	7
237	60	9	2022-03-08	2022-12-15	1
238	60	14	2022-03-11	2022-12-14	1
239	60	12	2022-03-07	2022-12-12	5
240	60	11	2022-03-07	2022-12-14	8
241	61	13	2022-03-09	2022-12-16	10
242	61	8	2022-03-11	2022-12-12	10
243	61	11	2022-03-09	2022-12-15	9
244	61	12	2022-03-10	2022-12-15	10
245	62	1	2022-03-11	2022-12-15	0
246	62	9	2022-03-09	2022-12-13	3
247	62	13	2022-03-11	2022-12-16	9
248	62	8	2022-03-09	2022-12-14	9
249	63	6	2022-03-09	2022-12-15	8
250	63	9	2022-03-08	2022-12-16	10
251	63	2	2022-03-07	2022-12-12	9
252	63	12	2022-03-08	2022-12-15	0
253	64	2	2022-03-10	2022-12-16	4
254	64	14	2022-03-07	2022-12-16	3
255	64	3	2022-03-09	2022-12-16	5
256	64	11	2022-03-09	2022-12-12	7
257	65	5	2022-03-10	2022-12-12	0
258	65	7	2022-03-09	2022-12-14	4
259	65	6	2022-03-07	2022-12-12	5
260	65	9	2022-03-08	2022-12-16	5
261	66	9	2022-03-11	2022-12-14	4
262	66	10	2022-03-10	2022-12-14	5
263	66	7	2022-03-07	2022-12-12	5
264	66	14	2022-03-08	2022-12-12	1
265	67	9	2022-03-11	2022-12-16	2
266	67	6	2022-03-10	2022-12-12	0
267	67	7	2022-03-08	2022-12-15	5
268	67	2	2022-03-07	2022-12-16	5
269	68	10	2022-03-07	2022-12-14	9
270	68	13	2022-03-10	2022-12-12	8
271	68	11	2022-03-10	2022-12-13	5
272	68	6	2022-03-10	2022-12-13	9
273	69	3	2022-03-08	2022-12-14	1
274	69	1	2022-03-09	2022-12-13	5
275	69	6	2022-03-10	2022-12-13	0
276	69	9	2022-03-11	2022-12-13	9
277	70	4	2022-03-10	2022-12-15	9
278	70	10	2022-03-11	2022-12-15	0
279	70	6	2022-03-10	2022-12-14	7
280	70	14	2022-03-09	2022-12-12	3
281	71	5	2022-03-11	2022-12-12	6
282	71	1	2022-03-07	2022-12-14	6
283	71	12	2022-03-10	2022-12-16	0
284	71	6	2022-03-08	2022-12-14	10
285	72	1	2022-03-09	2022-12-12	10
286	72	2	2022-03-07	2022-12-12	9
287	72	8	2022-03-08	2022-12-16	4
288	72	3	2022-03-07	2022-12-12	5
289	73	2	2022-03-09	2022-12-14	2
290	73	8	2022-03-07	2022-12-15	4
291	73	13	2022-03-07	2022-12-14	1
292	73	12	2022-03-10	2022-12-15	9
293	74	3	2022-03-10	2022-12-15	4
294	74	10	2022-03-07	2022-12-14	8
295	74	6	2022-03-08	2022-12-15	1
296	74	4	2022-03-08	2022-12-15	10
297	75	14	2022-03-11	2022-12-12	6
298	75	1	2022-03-08	2022-12-15	0
299	75	12	2022-03-07	2022-12-15	7
300	75	6	2022-03-10	2022-12-15	2
301	76	13	2022-03-09	2022-12-15	4
302	76	7	2022-03-09	2022-12-14	8
303	76	10	2022-03-09	2022-12-15	3
304	76	11	2022-03-11	2022-12-12	3
305	77	9	2022-03-08	2022-12-13	6
306	77	10	2022-03-11	2022-12-14	2
307	77	8	2022-03-08	2022-12-16	0
308	77	1	2022-03-07	2022-12-14	9
309	78	13	2022-03-09	2022-12-16	0
310	78	3	2022-03-11	2022-12-16	2
311	78	1	2022-03-08	2022-12-12	9
312	78	12	2022-03-11	2022-12-12	7
313	79	7	2022-03-10	2022-12-16	4
314	79	4	2022-03-07	2022-12-15	5
315	79	1	2022-03-10	2022-12-16	9
316	79	3	2022-03-09	2022-12-16	5
317	80	7	2022-03-09	2022-12-16	6
318	80	2	2022-03-11	2022-12-16	3
319	80	14	2022-03-10	2022-12-16	9
320	80	13	2022-03-11	2022-12-16	8
321	81	5	2022-03-10	2022-12-12	7
322	81	7	2022-03-09	2022-12-12	6
323	81	8	2022-03-09	2022-12-14	4
324	81	13	2022-03-11	2022-12-14	7
325	82	3	2022-03-07	2022-12-15	8
326	82	12	2022-03-07	2022-12-15	10
327	82	14	2022-03-11	2022-12-13	6
328	82	11	2022-03-10	2022-12-15	9
329	83	14	2022-03-07	2022-12-16	9
330	83	14	2022-03-09	2022-12-16	8
331	83	2	2022-03-08	2022-12-12	1
332	83	4	2022-03-09	2022-12-14	1
333	84	12	2022-03-08	2022-12-13	1
334	84	14	2022-03-08	2022-12-14	3
335	84	5	2022-03-07	2022-12-16	2
336	84	4	2022-03-09	2022-12-13	4
337	85	1	2022-03-09	2022-12-13	10
338	85	9	2022-03-11	2022-12-14	3
339	85	5	2022-03-10	2022-12-15	6
340	85	10	2022-03-08	2022-12-15	0
341	86	11	2022-03-09	2022-12-12	4
342	86	2	2022-03-07	2022-12-14	5
343	86	10	2022-03-10	2022-12-16	8
344	86	6	2022-03-07	2022-12-15	4
345	87	4	2022-03-11	2022-12-12	10
346	87	13	2022-03-10	2022-12-13	4
347	87	12	2022-03-09	2022-12-15	4
348	87	6	2022-03-10	2022-12-15	9
349	88	3	2022-03-08	2022-12-16	9
350	88	8	2022-03-11	2022-12-15	7
351	88	9	2022-03-07	2022-12-12	7
352	88	5	2022-03-11	2022-12-12	3
353	89	8	2022-03-08	2022-12-15	4
354	89	6	2022-03-10	2022-12-12	10
355	89	1	2022-03-11	2022-12-12	6
356	89	2	2022-03-10	2022-12-16	5
357	90	3	2022-03-11	2022-12-16	6
358	90	11	2022-03-10	2022-12-13	6
359	90	2	2022-03-11	2022-12-13	6
360	90	4	2022-03-08	2022-12-16	6
361	91	3	2022-03-09	2022-12-12	4
362	91	12	2022-03-09	2022-12-15	8
363	91	6	2022-03-07	2022-12-16	3
364	91	8	2022-03-09	2022-12-13	4
365	92	6	2022-03-08	2022-12-15	3
366	92	9	2022-03-10	2022-12-12	7
367	92	14	2022-03-08	2022-12-16	3
368	92	7	2022-03-11	2022-12-15	3
369	93	14	2022-03-10	2022-12-12	10
370	93	6	2022-03-09	2022-12-12	4
371	93	9	2022-03-10	2022-12-15	1
372	93	13	2022-03-07	2022-12-14	10
373	94	5	2022-03-08	2022-12-15	6
374	94	7	2022-03-10	2022-12-14	9
375	94	8	2022-03-09	2022-12-12	3
376	94	13	2022-03-09	2022-12-15	7
377	95	10	2022-03-09	2022-12-12	2
378	95	13	2022-03-07	2022-12-15	3
379	95	14	2022-03-11	2022-12-13	5
380	95	9	2022-03-11	2022-12-13	9
381	96	14	2022-03-07	2022-12-16	1
382	96	10	2022-03-07	2022-12-14	7
383	96	9	2022-03-10	2022-12-15	3
384	96	5	2022-03-11	2022-12-15	4
385	97	1	2022-03-10	2022-12-13	7
386	97	3	2022-03-10	2022-12-16	9
387	97	13	2022-03-09	2022-12-14	2
388	97	10	2022-03-10	2022-12-12	8
389	98	13	2022-03-10	2022-12-16	1
390	98	2	2022-03-09	2022-12-12	9
391	98	1	2022-03-08	2022-12-15	8
392	98	3	2022-03-08	2022-12-13	10
393	99	10	2022-03-08	2022-12-16	3
394	99	5	2022-03-11	2022-12-13	6
395	99	1	2022-03-10	2022-12-14	4
396	99	9	2022-03-10	2022-12-16	6
397	100	3	2022-03-07	2022-12-14	8
398	100	8	2022-03-08	2022-12-14	7
399	100	9	2022-03-09	2022-12-14	3
400	100	12	2022-03-09	2022-12-12	7
\.


--
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.instructors (id, first_name, last_name) FROM stdin;
1	Alice	Williams
2	David	Brown
3	Emily	Miller
4	James	Johnson
5	Linda	Davis
6	Michael	Smith
7	Sarah	Martinez
8	William	Jones
9	Jennifer	Anderson
10	Robert	Garcia
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.students (id, first_name, last_name, date_of_birth, email, address, phone, active, gender, height) FROM stdin;
1	Reece	Allison	2001-12-19	curae.phasellus@outlook.net	230-2425 Amet, St.	11-8579-4677	f	M	61
2	Claire	Becker	2008-04-04	phasellus@outlook.org	6889 Faucibus Ave	11-0631-0825	t	F	77
3	Riley	Chambers	2005-09-05	imperdiet.nec@outlook.org	P.O. Box 384, 973 Convallis, Road	11-3775-1131	t	F	73
4	Dorothy	Frazier	2007-05-04	ut.pellentesque.eget@google.ca	5828 Sed Road	11-3432-4969	f	F	89
5	Rooney	Knight	2004-02-04	lobortis.tellus@icloud.net	157-1622 Urna, Ave	11-8224-0426	t	M	54
6	Mari	Shields	2000-07-26	class.aptent.taciti@hotmail.com	3990 Hendrerit Street	11-5854-0745	t	F	90
7	Carlos	Pearson	2009-04-17	curabitur.dictum@protonmail.edu	Ap #653-9709 Commodo Road	11-6743-0131	t	M	51
8	Elliott	Becker	2004-06-25	amet.dapibus.id@aol.edu	P.O. Box 920, 5474 Mi Av.	11-5254-4436	f	M	54
9	Cullen	Mccray	2003-05-16	at.pede.cras@protonmail.org	P.O. Box 639, 607 Commodo Rd.	11-3405-7653	f	M	93
10	Hayfa	Carlson	2001-10-04	id.magna.et@protonmail.ca	526-7303 Consequat Road	11-8058-7235	f	F	68
11	Charles	Casey	2006-02-03	ut.quam.vel@hotmail.ca	9479 Eu Rd.	11-7514-3342	f	M	83
12	Ariel	Hinton	2010-06-11	aliquam.rutrum@protonmail.ca	P.O. Box 764, 3137 Ac St.	11-4318-8772	t	F	68
13	Macaulay	Morgan	2000-09-14	ipsum.phasellus.vitae@yahoo.edu	6747 Mattis. Av.	11-1784-8212	f	M	77
14	Violet	Levine	2008-05-14	leo.in@google.ca	Ap #434-9511 Eu St.	11-0304-0972	t	F	62
15	Catherine	Mayer	2001-05-15	imperdiet@hotmail.com	P.O. Box 243, 5937 Mollis Rd.	11-6116-4541	f	F	94
16	Jonas	Bradshaw	2000-07-29	integer.mollis.integer@hotmail.com	8239 Semper Avenue	11-0830-9287	f	M	58
17	Patrick	Chandler	2000-07-10	ut@google.net	Ap #897-3449 Eu Avenue	11-0541-2827	f	M	86
18	Ira	Sexton	2007-09-21	duis@protonmail.org	Ap #246-206 Vestibulum Avenue	11-3104-4325	f	F	53
19	Raya	Dyer	2010-05-19	nec.luctus@protonmail.couk	872-554 Vel St.	11-9519-8322	t	M	85
20	Dylan	Hall	2008-03-30	vestibulum@outlook.net	598-2648 Eu Ave	11-6987-5335	f	M	64
21	Faith	Estrada	2005-08-02	montes@icloud.com	3166 At Street	11-8361-5988	f	F	72
22	Brynne	Gilmore	2006-11-18	elit.pharetra.ut@google.edu	Ap #378-4386 Sodales Rd.	11-1567-4486	f	F	71
23	Octavius	Meyers	2002-07-15	nisl.maecenas@yahoo.edu	Ap #459-7236 Cursus, Av.	11-1033-8755	t	M	74
24	Hop	Mullins	2003-02-10	ligula.aliquam@icloud.net	8275 Ut Street	11-8365-7974	f	M	75
25	Neville	Navarro	2009-07-23	ante.ipsum.primis@icloud.edu	7579 Auctor Ave	11-0744-4613	t	M	67
26	Nomlanga	Harris	2005-07-16	cursus.a@icloud.com	775-9416 Purus Rd.	11-9063-8096	t	F	68
27	Branden	Compton	2010-11-12	eros.nec@protonmail.net	P.O. Box 606, 1713 Tempor Street	11-4229-8253	f	M	93
28	Zephania	Baxter	2009-03-24	montes.nascetur@aol.ca	Ap #970-8300 Fermentum St.	11-8038-8627	t	F	63
29	Ethan	Pittman	2005-04-07	ac@google.edu	Ap #535-967 Malesuada Street	11-8901-0261	t	M	72
30	Yasir	Grant	2000-06-16	sed@outlook.com	P.O. Box 354, 9889 Non Street	11-2670-2455	f	M	87
31	Melvin	Burke	2001-12-23	ligula@icloud.net	4942 Quis, Ave	11-6880-8714	f	M	89
32	Evangeline	Woodward	2010-04-11	varius.et.euismod@outlook.org	P.O. Box 678, 6453 Consequat Ave	11-9870-8479	f	F	61
33	Gavin	Le	2004-07-03	phasellus.dolor.elit@yahoo.ca	5925 Ut Street	11-0411-1233	t	M	60
34	Dolan	Fitzgerald	2004-11-23	eleifend.nunc.risus@protonmail.net	936-5635 Aliquet Ave	11-0745-5287	t	M	67
35	Stephanie	Mccullough	2003-02-07	lobortis@protonmail.ca	Ap #497-422 Magna. Rd.	11-4402-1372	f	F	84
36	Kylynn	Rivers	2008-03-04	mus@aol.com	Ap #780-9053 Parturient Rd.	11-1126-8358	f	M	78
37	James	Patton	2001-07-19	dictum@hotmail.com	579-976 Vitae, Road	11-2326-0848	f	M	81
38	Benedict	Serrano	2002-05-02	eget.odio@outlook.couk	449-4749 Non, Road	11-3274-1447	t	M	91
39	Garrett	Herring	2008-08-11	dictum.eu@yahoo.net	6960 Enim. Road	11-6225-1617	t	M	56
40	Francis	Sims	2006-07-30	et.magnis.dis@protonmail.net	478-3296 Justo. St.	11-5784-8115	t	M	65
41	Vincent	Jefferson	2006-07-28	arcu.imperdiet.ullamcorper@protonmail.com	179-5851 Magnis Rd.	11-7101-4458	t	M	64
42	Unity	Henson	2002-02-08	mi@outlook.couk	Ap #919-9147 Malesuada Street	11-7281-8465	t	M	99
43	Britanni	Brown	2001-02-16	vel.pede@hotmail.net	6834 Mi Av.	11-2439-0035	t	F	69
44	Regan	Brady	2008-02-01	tempus.non@protonmail.net	831-5868 Curabitur Road	11-4240-6583	t	M	75
45	Hu	Mayo	2006-07-19	amet@protonmail.edu	8479 Et St.	11-8353-6367	t	M	61
46	Samson	Davenport	2009-02-13	aliquam@yahoo.ca	P.O. Box 620, 919 Erat Avenue	11-1161-2816	t	M	82
47	Orli	Myers	2009-02-25	lacus.etiam@icloud.edu	485-9821 Tellus Ave	11-5728-2126	f	M	54
48	Beau	Russo	2000-04-24	facilisis.lorem.tristique@aol.net	P.O. Box 842, 442 Sem Avenue	11-4224-4836	f	M	52
49	Lyle	Ryan	2003-02-04	dapibus.quam.quis@hotmail.com	Ap #230-5446 Mi St.	11-3975-3805	t	M	63
50	Carol	Meadows	2003-02-19	enim.non.nisi@aol.edu	897-4451 Sapien Ave	11-8187-8615	f	F	87
51	Lionel	Burns	2008-02-25	eu@hotmail.edu	9372 Felis. Rd.	11-4416-5879	t	M	67
52	Ava	Haney	2010-05-08	sed.dictum@hotmail.ca	574-4658 Faucibus St.	11-1645-1572	f	F	90
53	James	Byers	2004-11-20	vel.faucibus@hotmail.couk	8647 Sit St.	11-2044-6861	t	M	98
54	Elmo	Strong	2003-04-14	at.nisi@outlook.net	1790 Eu St.	11-8761-2870	f	M	51
55	Darrel	Adams	2003-09-20	eget.venenatis@outlook.com	6730 Ipsum Ave	11-7758-6545	t	M	89
56	Fritz	Caldwell	2010-03-04	non.sapien@hotmail.ca	117-7261 Egestas Street	11-4570-4716	t	M	51
57	Lewis	Daugherty	2009-01-17	amet@google.edu	171-9132 Aliquam St.	11-5341-9171	f	M	71
58	Clark	Gonzales	2010-05-17	praesent.luctus@protonmail.couk	Ap #152-3626 Augue Road	11-5341-9436	t	M	62
59	Hayden	Knox	2006-04-28	vitae.purus@yahoo.couk	Ap #872-7399 Tristique Ave	11-2127-3541	t	M	51
60	Abel	Miranda	2009-05-16	sem.nulla@hotmail.ca	827-2563 Nisl. Ave	11-6500-8826	f	F	85
61	Amber	Gallagher	2009-02-23	aliquam@yahoo.org	Ap #928-6897 Turpis. Road	11-6217-0515	f	F	72
62	Russell	Oneil	2007-12-19	sodales.purus.in@yahoo.ca	Ap #625-3526 Cum Rd.	11-5846-6324	f	M	80
63	Rhonda	Winters	2003-04-21	eu@hotmail.com	735-7431 Lobortis Road	11-3423-0881	t	F	92
64	Jennifer	Aguilar	2000-12-14	nunc.risus@icloud.edu	242-7901 Donec Street	11-4860-6578	t	F	95
65	Marah	Greene	2008-12-28	orci.quis@protonmail.com	2997 Convallis St.	11-8724-2323	f	M	99
66	Cheryl	Ford	2002-02-17	convallis.in@protonmail.couk	545-2892 Aliquam Street	11-6564-4416	t	F	60
67	Donna	Norman	2001-05-09	ac.orci.ut@protonmail.net	P.O. Box 325, 3512 Cursus. Av.	11-1547-0664	f	F	80
68	Claudia	Armstrong	2006-05-08	augue.porttitor@aol.net	Ap #989-3161 Metus St.	11-8722-9652	f	F	50
69	Kamal	Burt	2002-03-01	etiam.ligula.tortor@outlook.com	546 Aliquam St.	11-8895-2951	f	M	97
70	Jason	Hamilton	2002-04-23	donec.nibh.enim@icloud.org	156-7091 Tempus, Av.	11-5088-0466	t	M	84
71	Claire	Watson	2000-02-10	nunc.nulla@google.com	Ap #269-5599 Id, Ave	11-3725-8123	t	F	58
72	Marny	Holden	2002-07-04	nibh.dolor@google.ca	Ap #981-3823 Molestie Avenue	11-4375-7919	f	F	51
73	Cooper	Franks	2009-04-24	nulla@hotmail.couk	Ap #400-5623 Fermentum Avenue	11-7891-8762	f	M	63
74	Clayton	Lamb	2009-12-04	mus@google.couk	184-8222 Pede. Street	11-1954-5948	t	M	70
75	Cameran	Dean	2005-06-22	lacus@protonmail.edu	P.O. Box 452, 7517 Ut Rd.	11-5554-5254	t	F	83
76	Walker	Whitehead	2010-03-27	blandit.enim.consequat@icloud.edu	P.O. Box 713, 7259 Quam Av.	11-3522-2735	f	M	56
77	Bevis	Gonzales	2005-02-09	ut.quam.vel@aol.net	556-4560 Neque. Rd.	11-5094-5755	f	M	57
78	Xantha	Scott	2010-07-24	justo.eu@protonmail.couk	P.O. Box 299, 8961 Sit Road	11-3736-6116	t	M	57
79	Orson	Humphrey	2002-12-19	dictum.eu@yahoo.ca	639-9362 Ultricies Ave	11-3619-0738	f	M	93
80	Aristotle	Chase	2010-12-07	donec.egestas@google.net	Ap #296-9628 Gravida Street	11-7825-0645	t	M	70
81	Shana	Hartman	2007-10-19	lacinia.mattis.integer@aol.edu	197-2845 Massa Road	11-5129-1524	f	F	78
82	Jerome	Hess	2003-12-18	cursus.purus.nullam@aol.couk	Ap #542-3820 Morbi Rd.	11-7450-2821	t	M	91
83	Macaulay	Huber	2005-03-24	turpis@aol.com	P.O. Box 790, 4357 Orci, Road	11-2113-8254	f	M	77
84	Randall	Anthony	2002-02-24	quam.elementum@hotmail.couk	P.O. Box 548, 6385 Magna Road	11-1688-6726	t	M	75
85	Sonia	Buchanan	2003-03-14	lobortis.augue@icloud.couk	500-3967 Lectus Rd.	11-1240-6398	f	F	97
86	Vielka	Le	2004-03-10	libero.lacus.varius@google.net	861-3396 Odio Street	11-7181-5582	f	F	63
87	Laura	Schroeder	2010-02-04	dui.suspendisse.ac@google.edu	Ap #692-1907 Donec Rd.	11-2538-0532	t	F	78
88	Simone	Kelley	2002-12-25	fusce@yahoo.org	866-1512 Nec, Av.	11-0381-4238	f	F	97
89	Carl	Pittman	2001-03-08	nec.urna.et@google.net	P.O. Box 259, 1853 Aliquet Street	11-8677-3333	t	M	65
90	Hashim	Landry	2007-09-17	convallis.convallis@yahoo.net	Ap #577-1750 Libero. Road	11-8780-6559	f	M	80
91	Yasir	Conley	2001-12-21	sed@outlook.net	431-9226 Est. Street	11-6489-9734	t	M	73
92	Adena	Phillips	2004-04-01	est@protonmail.com	Ap #150-1055 Aliquam Av.	11-8530-4861	t	F	97
93	Colt	Daniels	2006-04-12	ut.tincidunt.vehicula@google.edu	509-1011 Eleifend Road	11-8845-3557	f	M	76
94	Amethyst	Dunn	2005-02-27	ligula.donec@protonmail.ca	Ap #980-9816 Egestas. Street	11-5883-7672	f	M	85
95	Odette	Santiago	2009-03-11	egestas@google.org	P.O. Box 505, 4130 Tempor Av.	11-6762-7124	f	M	82
96	Cynthia	Terry	2008-03-10	egestas.rhoncus@yahoo.ca	Ap #409-8506 Vulputate, Road	11-8411-2029	f	F	57
97	Adena	Hull	2010-09-09	adipiscing.fringilla@protonmail.com	Ap #779-6717 Magna. St.	11-2268-5789	f	M	66
98	Emery	Wilder	2008-01-16	sit.amet@aol.org	8055 Luctus Avenue	11-3556-9027	t	F	73
99	Prescott	Adams	2002-05-14	placerat.orci@hotmail.net	8479 At Av.	11-1431-4186	t	M	53
100	Mark	Sheppard	2005-02-13	lacinia@outlook.couk	641-9105 Neque Street	11-3028-6648	f	M	77
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.courses_id_seq', 14, true);


--
-- Name: enrollments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.enrollments_id_seq', 400, true);


--
-- Name: instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.instructors_id_seq', 10, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.students_id_seq', 100, true);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: enrollments enrollments_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_pkey PRIMARY KEY (id);


--
-- Name: instructors instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: courses courses_instructor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_instructor_id_fkey FOREIGN KEY (instructor_id) REFERENCES public.instructors(id);


--
-- Name: enrollments enrollments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: enrollments enrollments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.enrollments
    ADD CONSTRAINT enrollments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

